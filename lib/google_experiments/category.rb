module GoogleExperiments
  class Category < Page
    attr_accessor :title, :subtitle, :link, :experiments, :about, :main_list
    def initialize(data)
      # saves basic info (title, subtitle, link) passed in from the homepage object
      data.each{|k, v| self.send("#{k}=", v)}
    end

    def scrape_page
      # gets the rest of the data (experiments, about) from the scraper
      data = SCRAPER.category(@link)

      # saves about
      @about = data[:about]

      # sets main_list and experiments to an array of new experiment objects
      @main_list = @experiments = data[:experiments].collect do |experiment_data|
        Experiment.new(experiment_data)
      end
    end
  end
end
