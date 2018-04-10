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

    # pass in the range of valid numbers and we'll get back to you
    # when/if the user enters such a number
    def get_input(min=1, max) 
      @user_input = gets.strip.downcase
      
      # exit
      if @user_input == 'exit' || @user_input == 'quit' || @user_input == 'q'
        exit

      # home
      elsif @user_input == 'home' || @user_input == 'welcome'
        self.run

      # help
      elsif @user_input == 'help' || @user_input == 'h'
        puts "\nenter a number between #{min} and #{max} to explor that option from the list."
        puts "enter 'home' or 'welcome' for the welcome screen."
        puts "or enter 'exit' 'quit' or 'q' to quit."
        # puts "or enter 'back' or 'b' to go back"
        self.get_input(min, max)

      # a valid number in the provided range
      elsif (Float(@user_input) != nil rescue false) && @user_input.to_i.between?(min, max)
        @user_input = @user_input.to_i - 1

      # it is an unrecocnized command
      else
        puts "sorry, what was that? enter a number between #{min} and #{max} or enter 'help' for more options."
        self.get_input(min, max)

      end
    end

    def welcome_page
      @homepage ||= Homepage.new
      puts "\nBrowse Cool Experiments From Google."
      puts "\n#{@homepage.about}"
      # puts ignores the last \n (if i didnt want it why would i put it there?) hence im using print 
      print "\nPlease choose a catigory and enter it's number\n\n"
      @homepage.categories.each.with_index do |catigory, i|
        print "#{i+1}. #{catigory.title}"
        (18 - catigory.title.length).times{ print ' '}
        puts "#{catigory.subtitle}"
      end
      puts ""
      self.get_input(1, @homepage.categories.length)
      self.catigory_page(@homepage.categories[@user_input])
    end

    def catigory_page(catigory)
      puts "\n\n#{catigory.title} - #{catigory.subtitle}"
      catigory.get_page
      self.get_input(2)
    end
  end
end
