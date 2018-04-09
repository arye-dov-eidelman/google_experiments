module GoogleExperiments
  class Homepage
    attr_reader :categories, :about
    def initialize
      unless @categories && @about
        @scraper = Scraper.new # should be defined elseware in the moduale scope
        homepage_data = @scraper.homepage
        @about = homepage_data[:about]
        @categories = []
        homepage_data[:categories].each do |category_data|
          @categories << Category.new(category_data)
        end
      end
    end
  end
end
