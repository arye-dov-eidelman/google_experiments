module GoogleExperiments
  class Scraper
    def initialize
      @base_url = ("https://experiments.withgoogle.com")
    end

    def homepage
      # open the all-categories page
      doc = Nokogiri::HTML(open(@base_url + '/collections'))
      # get all the data and return it in this hash
      {
        # get about (go to the actual homepage for this)
        about: Nokogiri::HTML(open(@base_url)).css("#main .wrapper .with60")[0].text,
        # get each category's data
        categories: doc.css(".box-holder.mobile-squared").collect do |card|
          {
            # get the title
            title: card.css(".headline")[0].text,
            # get subtitle
            subtitle: card.css(".subline")[0].text,
            # get link
            link: card.attribute('data-url').to_s
          }
        end
      }
    end

    def category(link)
      # open the category page specified in the passed in link
      doc = Nokogiri::HTML(open(@base_url + link))
      # get all the data and return it in this hash
      {
        # get about
        about: doc.css(".displaytext p")[0].text,
        # get each experiment's data
        experiments: doc.css(".expt-box").collect do |card|
          {
            # get title
            title: card.css(".box-name")[0].text,
            # get author
            author: card.css(".box-subname")[0].text,
            # get link to it's page
            link: card.css("a[onclick*=Overview]")[0].attribute('href').to_s
          }
        end
      }
    end

    def experiment(link)
      # open the experiment page specified in the passed in link
      doc = Nokogiri::HTML(open(@base_url + link))
      # change <br/> to \n in the intro
      # binding.pry
      doc.css('.displaytext div br')[0].replace("\n")
      # get all the data and return it in this hash
      {
        # get the intro minus the author
        intro: doc.css(".displaytext")[0].text.split("\n")[0],
        # get about
        about: doc.css(".single .displaytext")[0].text,
        # get the launch link if available
        launch: (if doc.css("a.button[onclick*=Launch]")[0] then doc.css("a.button[onclick*=Launch]").attribute('href').to_s end),
        # get the link to the source code if available
        code: (if element = doc.css("a.button[onclick*=Code]")[0] then doc.css("a.button[onclick*=Code]")[0].attribute('href').to_s end)
      }
    end
  end
end
