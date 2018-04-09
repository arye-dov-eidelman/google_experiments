module GoogleExperiments
  class CLI
    def initialize
      @user_input = ''
    end
    
    def run
      while true
        self.welcome_page
      end
    end

    def input
      @user_input = gets.strip.downcase
      if @user_input == 'exit' || @user_input == 'quit' || @user_input == 'q'
        exit
      else
        @user_input
      end
    end

    def welcome_page
      @homepage ||= Homepage.new
      puts "\nBrowse cool experiments from google."
      puts "\n#{@homepage.about}"
      puts "\nPlease choose a catigory and enter it's number"

      @homepage.categories.each.with_index do |catigory, i|
        puts "\n#{i+1}. #{catigory.title}"
        puts "     #{catigory.subtitle}"
      end
      puts ""
      self.input
    end
  end
end
