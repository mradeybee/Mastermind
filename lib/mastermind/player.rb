module Mastermind
  class Player
    include Input
    attr_writer :h_num
    attr_reader :input

    def initialize
      @h_num = 0
      @msg = Message.new
      @code = %w[r g b y c m]
    end

    def is_valid?(incode)
      arr = []
      for i in incode
        arr << i if @code.include?(i)
      end
      arr
      true if arr == incode
    end

    def player_entry(difficulty, computer_code)
      input = user_input

      if input == 'q'
        puts @msg.quit_msg.to_s
        exit
      elsif input == 'h'
        if @h_num < difficulty + 1
          @h_num += 1
          hint(difficulty, computer_code)
        else
          puts @msg.hint_exceeded_msg.to_s
          invalid(difficulty, computer_code)
        end
      elsif input.length > difficulty
        puts @msg.too_long.to_s
        invalid(difficulty, computer_code)
      elsif input.length < difficulty
        puts @msg.too_short.to_s
        invalid(difficulty, computer_code)
      elsif is_valid?(input.split(//))
        input = input.split(//)
      else
        puts @msg.invalid_entry_msg.to_s
        invalid(difficulty, computer_code)
      end
    end

    def invalid(difficulty, computer_code)
      player_entry(difficulty, computer_code)
    end

    def hint(difficulty, computer_code)
      h = rand(1..4)
      puts @msg.hint_msg(h, computer_code).to_s
      h = rand(1..4)
      player_entry(difficulty, computer_code)
    end
  end
end
