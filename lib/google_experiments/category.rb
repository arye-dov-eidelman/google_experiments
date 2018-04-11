module GoogleExperiments
  class Category < Page
    attr_accessor :title, :subtitle, :link, :experiments, :about, :main_list
    def initialize(data)
      data.each{|k, v| self.send("#{k}=", v)}
      @main_list = @experiments
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
