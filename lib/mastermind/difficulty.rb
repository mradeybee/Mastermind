require "colorize"
require_relative 'input'

module Mastermind
  module Difficulty
   
    def difficulty(msg)
      puts "#{msg.difficulty_select}"
      input = user_input
      case 
        when input == "b"
          puts "#{msg.beginer_msg}"
          return col = 0
        when input == "m"
          puts "#{msg.intermidiate_msg}"
          return col = 2
        when input == "a"
          puts "#{msg.advance_msg}"
          return col = 4
        else  
          puts "#{msg.invalid_entry_msg}"
          non_valid(msg)
      end
    end

    def non_valid(msg)
      difficulty(msg)
    end
  end
end
