module GoogleExperiments
  class Homepage < Page
    attr_reader :categories, :about, :main_list
    def initialize
      @main_list = @categories
      self.get_page
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
