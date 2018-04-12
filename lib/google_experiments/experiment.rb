module GoogleExperiments
  class Experiment < Page
    attr_accessor :title, :author, :link, :intro, :about, :launch, :code
    def initialize(data)
      data.each{|k, v| self.send("#{k}=", v)}
    end

    def scrape_page
      data = SCRAPER.experiment(@link)
      data.each{|k, v| self.send("#{k}=", v)}
    end
  end
end
