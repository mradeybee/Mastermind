module Mastermind

  ####################################
  #This is the user input class. All 
  # inputs from the user is generated
  # by this class
  #####################################
    module Input
      def user_input
        gets.chomp.downcase
      end
    end
end