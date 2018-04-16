module GoogleExperiments
  class Category < Page
    attr_accessor :title, :subtitle, :link, :experiments, :about, :main_list
    def initialize(data)
      data.each{|k, v| self.send("#{k}=", v)}
    end

    def scrape_page
      data = SCRAPER.category(@link)
      @about = data[:about]
      @main_list = @experiments = data[:experiments].collect do |experiment_data|
        Experiment.new(experiment_data)
      end
    end
  end
end
