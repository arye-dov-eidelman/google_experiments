module GoogleExperiments
  class Category
    attr_accessor :title, :subtitle, :link 
    def initialize(data)
      data.each{|k, v| self.send("#{k}=", v)}
    end
  end
end
