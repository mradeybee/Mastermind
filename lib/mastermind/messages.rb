module Mastermind
  class Message
    def initialize
      @red = '(r)ed'.colorize(color: :red)
      @green = '(g)reen'.colorize(color: :green)
      @blue = '(b)lue'.colorize(color: :blue)
      @yellow = '(y)ellow'.colorize(color: :yellow)
      @cyan = '(c)yan'.colorize(color: :cyan)
      @magenta = '(m)agenta'.colorize(color: :magenta)
    end

    def too_long
      'Your input is too long'
    end

    def too_short
      'Your input is too short'
    end

    def result(exact, partial)
      "You have #{exact} exact match(es) and #{partial} partial match(es)"
    end

    def leader_msg(name, computer_code, counter, final_time)
      "#{name} guessed the sequence #{computer_code} in #{counter} rounds within #{final_time} seconds"
    end

    def rounds(counter)
      round_text = counter == 13 ? 'Final Round ' : "Round #{counter}"
      "#{'*' * 10} #{round_text} #{'*' * 10}"
    end

    def player_game(player_input)
      "You played #{player_input}."
    end

    def comp_choice_msg(computer_code)
      "The computer chose #{computer_code}"
    end

    def difficulty_select
      'Select difficulty level, (b)eginner, (m)medium, (a)dvance or (q)uit'
    end

    def welcome_msg
      'Welcome to Mastermind'
    end

    def play_msg
      'Press (p) to play, (i) to read the instructions, (l) to view leaderboard  or (q) to quit?'
    end

    def beginer_msg
      "I have generated a beginner sequence with four elements made up of: #{@red}, #{@green}, #{@blue} and #{@yellow} Use (h) to get hints, you have 1 hint. Use (q)uit at any time to end the game."
    end

    def intermidiate_msg
      "I have generated an intermidiate sequence with six elements made up of: #{@red}, #{@green}, #{@blue}, #{@yellow}, #{@cyan} and #{@magenta}. Use (h) to get hints, you have 3 hint. Use (q)uit at any time to end the game."
    end

    def advance_msg
      "I have generated an advance sequence with eight elements made up of: #{@red}, #{@green}, #{@blue}, #{@yellow}, #{@cyan}, and #{@magenta}. Use (h) to get hints, you have 5 hint. Use (q)uit at any time to end the game."
    end

    def hint_msg(h, computer_code)
      "#{computer_code[h - 1]} is at position #{h} in the computer's choice"
    end

    def win_msg(final_time, counter, computer_code)
      "#{'*' * 10} You Win!!! #{'*' * 10}
      You won in #{final_time} seconds within #{counter} rounds
      The computer chose #{computer_code}"
    end

    def bye
      'Thanks for playing! :)'
    end

    def hint_exceeded_msg
      'You have exceeded your hint limit'
    end

    def name_msg
      'Enter your Name!'
    end

    def quit_msg
      'You have quit the game'
    end

    def namer_msg
      'Enter your name'
    end

    def invalid_entry_msg
      'Invalid entry, try again'
    end

    def game_over_msg(computer_code, final_time)
      "Game Over!
      :( You Loose ):
      The computer chose #{computer_code}
      You  played the game for #{final_time} seconds"
    end

    def instruction_msg
      <<-EOS
        This is Mastermind
        ** The Computer has chosen a set of colors, and the aim of the game is for you to find out those colors.
        ** You can press (h) to get a clue to the get the Computer's choice at the cost of a turn.
        ** You win when you guess all the Computer's choice correctly.
        ** You loose if you dont get the correct computer's choice after 12 rounds.
        ** Exact matches mean you guesed the right color at the right spot.
        ** Partial matches mean you guesed the write color but not on the right spot.
        *** Happy playing ***
      EOS
    end

    def logo
      "
          _____         _           _____ _       _
         |     |___ ___| |_ ___ ___|     |_|___ _| |
         | | | | .'|_ -|  _| -_|  _| | | | |   | . |
         |_|_|_|__,|___|_| |___|_| |_|_|_|_|_|_|___|"
    end
  end
end
