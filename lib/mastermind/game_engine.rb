require_relative 'input'
require_relative 'difficulty'

module Mastermind
  class Game_Engine
    include Input
    include Difficulty
    attr_reader :status, :player, :counter, :final_time,
    :start_time ,:computer_code, :leaderboard
   
    def initialize
      @player = Player.new    
      @msg = Message.new
      @start_time  = 0
      @counter = 0
    end

    def welcome
      puts "#{@msg.logo}"
      puts "#{@msg.welcome_msg}"
    end

    def instructions
      puts "#{@msg.instruction_msg}"
      ask
    end

    def ask
      puts "#{@msg.play_msg}"
      input = user_input
      case 
        when input == "l"
          leaderboard
        when input == "p"
          game
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

    def exact_match(ccode, player_input)
      exact = 0 ; i = 0 ; comp_copy = ccode.dup             
        while i < comp_copy.length
          if comp_copy[i] == player_input[i]
            exact += 1 ; comp_copy[i] = 0
          end
          i += 1
        end
      [comp_copy, exact]
    end

    def partial_match(comp_copy, player_input)
      sec_copy = comp_copy.dup ; i = 0 ; partial = 0                                                       
      while i < sec_copy.length
        part = sec_copy.index(player_input[i])
        if !!sec_copy[i] != 0 && !! part
          partial += 1 ; sec_copy[part] = 0
        end     
      i += 1
      end
      partial                                                       
    end  

    def game
      @player.h_num = 0
      col = difficulty(@msg)  
      @computer_code = Code_generator.new.computer_choice(col)
      @start_time = Time.now
      loop do
        @player_input = @player.player_entry(col, @computer_code)
        exact = exact_match(@computer_code, @player_input) 
        partial = partial_match(exact[0], @player_input)
        @counter += 1
        analysis(@player_input, exact[1], partial)
        break if exact[1] == exact[0].length
      end
      winner
    end

 
    def analysis(player_input, exact, partial)
      puts "#{@msg.rounds(player_input, @counter)}"
      puts "#{@msg.result(exact,partial)}"
      try_again(exact, partial)     
    end


    def winner
     @final_time = (Time.now - @start_time).to_i
      puts "#{@msg.win_msg(@final_time, @counter, @computer_code)}"   
      namer ; save_file; @counter = 0 
      ask
    end


    def try_again(exact, partial)
      @final_time = (Time.now - @start_time).to_i
      if @counter >= 12
      puts "#{@msg.game_over_msg(@computer_code, @final_time)}"
      @counter = 0; ask
      end
    end


    def namer
      puts "#{@msg.namer_msg}"
      @name = user_input
    end


    def save_file(filename = "game_results.txt")
      File.open(filename, "a+") do | line |
        line.puts "#{@msg.leader_msg(@name, @computer_code, @counter, @final_time)}"
      end
    end

    def leaderboard(filename = "game_results.txt" )
      lead_arr = []
      File.open(filename, "r") do | lines |
        lines.each_line do |text| 
          lead_arr << text
          @leader = lead_arr.sort_by { |line| Result.new(line)}
        end
      end
      puts "#{@leader.first(10).join.to_s}"
      ask
    end

  end #end class
end #end module