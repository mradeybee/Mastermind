module Mastermind

  ####################################
  #This is the user input class. All 
  # inputs from the user is generated
  # by this class
  #####################################
    class Input
      def user_input
        input = gets.chomp.downcase
      end
    end
end