module GoogleExperiments
  class Scraper
    def initialize
      @base_url = ("https://experiments.withgoogle.com")
    end

    def homepage
      doc = Nokogiri::HTML(open(@base_url))
      about = doc.css("#main .wrapper .with60")[0].text
      categories = []
      doc.css(".box-wrap").each do |card|
        break if !card.css(".headline")[0]
        category = {}
        card.css('br').each{|br| br.replace("\n")}
        category[:title] = card.css(".headline")[0].text.split("\n")[0]
        category[:subtitle] = card.css(".subline")[0].text
        category[:link] = card.css("a")[0].attribute('href').to_s
        categories << category
      end

      {categories: categories, about: about}
    end

    def category(link)
      doc = Nokogiri::HTML(open(@base_url + link))
      about = doc.css("#main .wrapper .with60")[0].text
      experiments = []
      doc.css(".expt-box").each do |card|
        # binding.pry
        # break if !card.css(".headline")[0]
        experiment = {}
        # card.css('br').each{|br| br.replace("\n")}
        experiment[:title] = card.css(".box-name")[0].text
        experiment[:author] = card.css(".box-subname")[0].text
        experiment[:link] = card.css("a")[0].attribute('href').to_s
        experiments << experiment
      end

      {experiments: experiments, about: about}

    end
  end
end
