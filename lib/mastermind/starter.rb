require "colorize"
require_relative 'input'
require_relative 'difficulty'

module Mastermind

  class Starter

    include Input
    include Difficulty

    def initialize 
      @msg = Message.new
    end 

   

    

    def ask
      input = user_input
      case 
      when input == "p"
        difficulty  
      when input == "q"
        puts "#{@msg.quit_msg}"
        exit
      when input == "i"
        instructions
      else
        invalid
      end
    end

    def invalid
      puts "#{@msg.invalid_entry_msg}"
      ask
    end
    
  

  end # end class Starter
end # end module