module GoogleExperiments
  class CLI
    def initialize
      @scraper = Scraper.new
      @homepage = Homepage.new
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
      # @homepage
      puts "\nBrowse cool experiments from google."
      puts "\nPlease choose a catigory and enter it's number"
      puts "\n1. Voice"
      puts "     Explore voice interaction in fun new ways."
      puts "\n2. Arts & Culture"
      puts "     See what happens at the crossroads of art and technology."
      puts "\n3. AR"
      puts "     Explorations in augmented reality."
      puts "\n4. WebVR"
      puts "     See what’s possible with virtual reality on the web."
      puts "\n5. AI"
      puts "     See what happens when anyone can play with machine learning."
      puts "\n6. Android"
      puts "     See how creativity and code come together on Android."
      puts "\n7. Chrome"
      puts "     See how creativity and code come together on the web."
      puts ""
      self.input
    end
  end
end