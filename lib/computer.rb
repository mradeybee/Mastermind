require "colorize"
class Code_generator
    def computer_choice
        arr = []
        code = ["r","g","b","y","p","v"]
        until arr.length == 4
            i = Random.rand (0..3)
            arr << code[i]
        end
        arr
    end
    Computer = Code_generator.new.computer_choice
end