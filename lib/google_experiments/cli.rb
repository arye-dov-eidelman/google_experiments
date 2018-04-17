module GoogleExperiments
  class CLI
    def initialize
      @user_input = ''
      @history = []
    end
    
    def run
      # start the cli interface

      while true
        # save navigation to history
        @history << {method: self.method(:welcome_page)}
        self.welcome_page
      end
    end

    def back

      @history.pop
      last_page = @history.last
      if last_page.has_key?(:parameter)
        last_page[:method].call(last_page[:parameter])
      else
        last_page[:method].call
      end
    end
    
    def print_paragraph(p)
      # formats and prints the paragraph
      print "\n#{p.scan(/.{1,90}(?: |$)/).join("\n")}\n"
    end

    def get_and_validate_input(max)
      # gets user input and checks for commands and valid numbers in the
      # provided range. Not to be relied on for it's return value instead
      # use @user_input after running get_and_validate_input(max)

      @user_input = gets.strip.downcase

      # exit
      if @user_input == 'exit' || @user_input == 'quit' || @user_input == 'q'
        exit

      # home
      elsif @user_input == 'home' || @user_input == 'welcome' || @user_input == '0'
        self.run

      # back
      elsif (@user_input == 'back' || @user_input == 'b') && @history.size > 1
        self.back

      # help
      elsif @user_input == 'help' || @user_input == 'h'
        puts "\nenter a number between 1 and #{max} to explor that option from the list."
        puts "enter 'home' 'welcome' or '0' for the welcome screen."
        puts "'b' or 'back' for the last page." if @history.size > 1
        puts "or enter 'exit' 'quit' or 'q' to quit."
        # puts "or enter 'back' or 'b' to go back"
        self.get_and_validate_input(max)

      # a valid number in the provided range
      elsif (Float(@user_input) != nil rescue false) && @user_input.to_i.between?(1, max) && max != 0
        @user_input = @user_input.to_i - 1

      # it is an unrecocnized command
      else
        puts "sorry, what was that? enter a number between 1 and #{max} or enter 'help' for more options."
        self.get_and_validate_input(max)

      end
    end

    def welcome_page
      # display the homepage options from experiments.withgoogle.com

      @homepage ||= Homepage.new
      puts "\nBrowse Cool Experiments From Google."
      print_paragraph(@homepage.about)

      # puts ignores the last \n hence im using print
      # if i didnt want it why would i put it there?
      print "\nPlease choose a catigory and enter it's number\n\n"

      # prints a list of categories with an option number title and subtitle
      # for each category properly spaced in 2 columns
      @homepage.categories.each.with_index do |catigory, i|
        puts "#{i+1}. #{catigory.title}#{@homepage.tab(i)}#{catigory.subtitle}"
      end
      puts ""

      # gets user input and navigates to the direct page
      self.get_and_validate_input(@homepage.categories.length)

      # save navigation to history
      @history << {method: self.method(:catigory_page), parameter: @homepage.categories[@user_input]}
      self.catigory_page(@homepage.categories[@user_input])
    end

    def catigory_page(catigory)
      # display all experiments using a specifec technology or topic

      # prints title subtitle and more about this catigory
      puts "\n\n#{catigory.title} - #{catigory.subtitle}"
      catigory.get_page
      print_paragraph(catigory.about)
      print "\nPlease choose an experiment and enter it's number\n\n"
      
      # prints a list of experiments with an option number title and author
      # for each experiment properly spaced in 2 columns
      catigory.experiments.each.with_index do |experiment, i|
        puts "#{i+1}. #{experiment.title}#{catigory.tab(i)}#{experiment.author}"
      end
      puts ""

      # gets user input and navigates to the direct page
      self.get_and_validate_input(catigory.experiments.length)

      # save navigation to history
      @history << {method: self.method(:experiment_page), parameter: catigory.experiments[@user_input]}
      self.experiment_page(catigory.experiments[@user_input])
    end

    def experiment_page(experiment)
      # tell the user all about this experiment
      # with options to try it out or veiw the soure code if possible 

      # print title author intro and moore about this experiment
      puts "\n\n#{experiment.title} - #{experiment.author}"
      experiment.get_page
      print_paragraph(experiment.intro)
      print_paragraph(experiment.about)
      puts ""

      # if possible display options to try the experiment or veiw the soure code 
      puts "#{option_number = 0}. home"
      if experiment.launch
        puts "#{option_number += 1}. Launch in browser"
      end
      if experiment.code
        puts "#{option_number += 1}. view on github"
      end
      puts ""

      # gets user input
      self.get_and_validate_input(option_number)

      # save navigation to history
      @history << {method: self.method(:welcome_page)}

      # and navigates to the direct page in the brower or go back to thew welcome page
      if @user_input == 0 && experiment.launch
        puts "launching in browser..."
        Launchy.open(experiment.launch)
      else
        puts "opening on github..."
        Launchy.open(experiment.code)
      end
    end
  end
end
