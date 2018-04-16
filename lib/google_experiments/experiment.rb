module GoogleExperiments
  class Experiment < Page
    attr_accessor :title, :author, :link, :intro, :about, :launch, :code
    def initialize(data)
      # saves basic info (title, author, link) passed in from the category object
      data.each{|k, v| self.send("#{k}=", v)}
    end

    def scrape_page
      # saves the rest of the data (intro, about, launch, code) from the scraper
      data = SCRAPER.experiment(@link)
      data.each{|k, v| self.send("#{k}=", v)}
    end
  end
end
