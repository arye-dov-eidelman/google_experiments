module GoogleExperiments
  class Experiment
    attr_accessor :title, :author, :link
    def initialize(data)
      data.each{|k, v| self.send("#{k}=", v)}
      
    end
  end
end
