require "colorize"
require_relative "main"
module Mastermind
  
  class Code_generator
    attr_reader :computer
    
    def computer_choice(col = nil)
      @computer = []
      code = ["r","g","b","y","c","m"]
      col_val = 4 + col
      limit = col_val > code.size ? code.size : col_val
      until @computer.length == col_val
        i = Random.rand (0...limit)
        @computer << code[i];  @computer.uniq
      end
      @computer
    end
  
  end
end