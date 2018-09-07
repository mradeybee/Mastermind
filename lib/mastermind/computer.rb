module Mastermind
  class CodeGenerator
    def computer_choice(difficulty)
      choices = []
      code = %w[r g b y c m]
      limit = difficulty > code.size ? code.size : difficulty
      until choices.length == difficulty
        index = Random.rand(0...limit)
        choices << code[index]
      end
      choices
    end
  end
end
