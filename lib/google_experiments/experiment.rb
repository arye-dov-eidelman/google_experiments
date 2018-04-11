module GoogleExperiments
  class Experiment < Page
    attr_accessor :title, :author, :link
    def initialize(data)
      data.each{|k, v| self.send("#{k}=", v)}
      
    end
  end
end
