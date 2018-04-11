module GoogleExperiments
  class Homepage
    attr_reader :categories, :about
    def initialize
      self.get_page
    end

    def get_page
      (@categories && @about) || self.scrape_page
    end

    def scrape_page
      data = SCRAPER.homepage
      @about = data[:about]
      @categories = []
      data[:categories].each do |category_data|
        @categories << Category.new(category_data)
      end
    end
  end
end
