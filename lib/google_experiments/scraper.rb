module GoogleExperiments
  class Scraper
    def initialize
      @base_url = ("https://experiments.withgoogle.com")
    end

    def homepage
      doc = Nokogiri::HTML(open(@base_url))
      {
        about: doc.css("#main .wrapper .with60")[0].text,
        categories: doc.css(".box-wrap").reject do |card|
          !card.css(".headline")[0]
        end.collect do |card|
          card.css(".headline br")[0].replace("\n")
          {
            title: card.css(".headline")[0].text.split("\n")[0],
            subtitle: card.css(".subline")[0].text,
            link: card.css("a")[0].attribute('href').to_s
          }
        end
      }
    end

    def category(link)
      doc = Nokogiri::HTML(open(@base_url + link))
      {
        about: doc.css("#main .wrapper .with60")[0].text,
        experiments: doc.css(".expt-box").collect do |card|
          {
            title: card.css(".box-name")[0].text,
            author: card.css(".box-subname")[0].text,
            link: card.css("a[onclick*=Overview]")[0].attribute('href').to_s
          }
        end
      }
    end

    def experiment(link)
      doc = Nokogiri::HTML(open(@base_url + link))
      doc.css('#exp-intro .displaytext p br')[0].replace("\n")
      {
        intro: doc.css("#exp-intro .displaytext p")[0].text.split("\n")[0],
        about: doc.css(".single .displaytext")[0].text,
        launch: (if doc.css("a.button[onclick*=Launch]")[0] then doc.css("a.button[onclick*=Launch]").attribute('href').to_s end),
        code: (if element = doc.css("a.button[onclick*=Code]")[0] then doc.css("a.button[onclick*=Code]")[0].attribute('href').to_s end)
      }
    end
  end
end
