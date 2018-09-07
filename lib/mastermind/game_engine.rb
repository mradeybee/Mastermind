require_relative 'input'
require_relative 'difficulty'

module Mastermind
  class GameEngine
    include Input
    include Difficulty
    attr_reader :status, :player, :counter, :final_time,
                :start_time, :computer_code, :leaderboard

    attr_writer :counter

    def initialize
      @player = Player.new
      @msg = Message.new
      @start_time = 0
      @counter = 1
    end

    def welcome
      puts @msg.logo.to_s
      puts @msg.welcome_msg.to_s
    end

    def instructions
      puts @msg.instruction_msg.to_s
      ask
    end

    def ask
      puts @msg.play_msg.to_s
      input = user_input
      if input == 'l'
        leaderboard
      elsif input == 'p'
        game
      elsif input == 'q'
        puts @msg.quit_msg.to_s
        puts @msg.bye.to_s
        exit
      elsif input == 'i'
        instructions
      else
        invalid
      end
    end

    def invalid
      puts @msg.invalid_entry_msg.to_s
      ask
    end

    def exact_match(computer_input, player_input)
      exact_match_count = 0
      player_input.each_with_index do |_, index|
        if computer_input[index] == player_input[index]
          computer_input[index] = '*'
          exact_match_count += 1
        end
      end
      [computer_input, exact_match_count]
    end

    def partial_match(computer_input, player_input)
      partial_match_count = 0
      player_input.each_with_index do |input, index|
        match_index = computer_input.index(input)
        next if match_index.nil?

        if match_index
          partial_match_count += 1
          computer_input[match_index] = '#'
        end
      end
      partial_match_count
    end

    def game
      @player.h_num = 0
      difficulty = difficulty(@msg)
      @computer_code = CodeGenerator.new.computer_choice(difficulty)
      @start_time = Time.now
      loop do
        puts @msg.rounds(@counter).to_s 
        @player_input = @player.player_entry(difficulty, @computer_code)
        exact_match = exact_match(@computer_code.dup, @player_input)
        partial_match = partial_match(exact_match[0], @player_input)
        @counter += 1
        break if exact_match[1] == computer_code.length
        analysis(@player_input, exact_match[1], partial_match)
      end
      winner
    end

    def analysis(player_input, exact, partial)
      puts @msg.result(exact, partial).to_s
      try_again(exact, partial) if @counter == 13
    end

    def winner
      @final_time = (Time.now - @start_time).to_i
      puts @msg.win_msg(@final_time, @counter, @computer_code.join('')).to_s
      name_and_reset
    end

    def name_and_reset
      namer
      save_file
      @counter = 0
      ask
    end

    def try_again(_exact, _partial)
      @final_time = (Time.now - @start_time).to_i
      puts @msg.game_over_msg(@computer_code.join(''), @final_time).to_s
      @counter = 0
      ask
    end

    def namer
      puts @msg.namer_msg.to_s
      @name = user_input
    end

    def save_file(filename = 'game_results.txt')
      File.open(filename, 'a+') do |line|
        line.puts @msg.leader_msg(@name, @computer_code, @counter, @final_time).to_s
      end
    end

    def leaderboard(filename = 'game_results.txt')
      lead_arr = []
      File.open(filename, 'r') do |lines|
        lines.each_line do |text|
          lead_arr << text
          @leader = lead_arr.sort_by { |line| Result.new(line) }
        end
      end
      puts @leader.first(10).join.to_s
      ask
    end
  end # end class
end # end module
