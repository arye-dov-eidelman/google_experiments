module GoogleExperiments
  class Scraper
    def initialize
          
    end

    def homepage
      doc = open("https://experiments.withgoogle.com")
      doc = Nokogiri::HTML(doc)
      about = doc.css("#main .wrapper .with60")[0].text
      categories = []
      doc.css(".box-wrap").each do |card|
        break if !card.css(".headline")[0]
        category = {}
        card.css('br').each{|br| br.replace(" ")}
        category[:title] = card.css(".headline")[0].text
        category[:subtitle] = card.css(".subline")[0].text
        category[:link] = card.css("a")[0].attribute('href').to_s
        categories << category
      end

      {categories: categories, about: about}
    end
  end
end
