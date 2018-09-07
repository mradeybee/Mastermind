module Mastermind
  module Difficulty
    include Input

    def difficulty(message)
      puts message.difficulty_select.to_s
      input = user_input
      case input
      when 'b'
        beginer(message)
      when 'm'
        intermidiate(message)
      when 'a'
        advance(message)
      when 'q'
        quit(message)
      else
        puts message.invalid_entry_msg.to_s
        non_valid(message)
      end
    end

    def beginer(message)
      puts message.beginer_msg.to_s
      4
    end

    def intermidiate(message)
      puts message.intermidiate_msg.to_s
      6
    end

    def advance(message)
      puts message.advance_msg.to_s
      8
    end

    def quit(message)
      puts message.quit_msg.to_s
      puts message.bye.to_s
      exit
    end

    def non_valid(message)
      difficulty(message)
    end
  end
end
