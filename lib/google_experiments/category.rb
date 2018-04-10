module GoogleExperiments
  class Category
    attr_accessor :title, :subtitle, :link, :experiments, :about
    def initialize(data)
      data.each{|k, v| self.send("#{k}=", v)}
    end

    def get_page
      (@experiments && @about) || self.scrape_page
    end

    def scrape_page
      data = SCRAPER.category(@link)
      @about = data[:about]
      @experiments = []
      data[:experiments].each do |experiment_data|
        @experiments << Experiment.new(experiment_data)
      end
    end
  end
end
