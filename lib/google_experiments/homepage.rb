module GoogleExperiments
  class Homepage < Page
    attr_reader :categories, :about, :main_list
    def initialize
      self.get_page
    end

    def scrape_page
      # gets the data (categories, about, main_list) from the scraper
      data = SCRAPER.homepage

      # saves about
      @about = data[:about]

      # sets main_list and categories to an array of new category objects
      @main_list = @categories = data[:categories].collect do |category_data|
         Category.new(category_data)
      end
    end
  end
end
