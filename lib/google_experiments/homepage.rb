module GoogleExperiments
  class Homepage
    attr_reader :categories, :about
    def initialize
      unless @categories && @about
        homepage_data = SCRAPER.homepage
        @about = homepage_data[:about]
        @categories = []
        homepage_data[:categories].each do |category_data|
          @categories << Category.new(category_data)
        end
      end
    end
  end
end
