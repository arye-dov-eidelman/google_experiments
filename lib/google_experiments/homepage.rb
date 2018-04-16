module GoogleExperiments
  class Homepage < Page
    attr_reader :categories, :about, :main_list
    def initialize
      self.get_page
    end

    def scrape_page
      data = SCRAPER.homepage
      @about = data[:about]
      @main_list = @categories = data[:categories].collect do |category_data|
         Category.new(category_data)
      end
    end
  end
end
