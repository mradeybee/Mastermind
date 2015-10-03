require "colorize"
class Code_generator
    attr_reader :computer
    def computer_choice(col)
        @computer = []
        code = ["r","g","b","y","c","m"]
        col_val = 4 + col
        until @computer.length == col_val
            i = Random.rand (0...col_val)
            @computer << code[i]
        end
        @computer
    end
end