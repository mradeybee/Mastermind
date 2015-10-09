require 'pry'
require_relative 'input'
require_relative 'difficulty'

module Mastermind

  class Game_Engine
    include Input
    include Difficulty
    attr_reader :status, :player, :counter, :final_time, :start_time ,:computer_code 
    def initialize(col)
      starter = Starter.new
      @computer_code = Code_generator.new.computer_choice(col)
      @player = Player.new    
      @msg = Message.new
      @status = :started
      @start_time  = 0
    end

    def exact_match(ccode, player_input)
      exact = 0
      i = 0 
      comp_copy = ccode.dup             
        while i < comp_copy.length
          if comp_copy[i] == player_input[i]
            exact += 1
            comp_copy[i] = 0
          end
          i += 1
        end
      [comp_copy, exact]
    end  



    def partial_match(comp_copy, player_input)
      sec_copy = comp_copy.dup
      i = 0 
      partial = 0                                                       
      while i < sec_copy.length
        part = sec_copy.index(player_input[i])
        if !!sec_copy[i] != 0 && !! part
          partial += 1
          sec_copy[part] = 0
        end     
      i += 1
      end
      partial                                                       
    end   



    def replay
      puts "#{@msg.play_again}"
      input = user_input
      if input == "p"
        difficulty
      elsif input =="q"
        puts "#{@msg.bye}"
        exit
      else
        puts "#{@msg.invalid_entry_msg}"
        replay
      end
    end



    def game(col)
      @counter = 0
      @start_time = Time.now
      loop do
        @player_input = @player.player_entry(col, @computer_code)
        exact = exact_match(@computer_code, @player_input) 
        partial = partial_match(exact[0], @player_input)
        @counter += 1
        analysis(@player_input, exact[1], partial)
        break if exact[1] == exact[0].length
      end
      winner(col)
    end
 

    def analysis(player_input, exact, partial)
      puts "You played #{player_input}. Round #{@counter} 0f 12"
      try_again(exact, partial)     
    end


    def winner(col)
     @final_time = (Time.now - @start_time).to_i
      puts "#{@msg.win_msg}
      You won in #{@final_time} seconds within #{@counter} rounds
      The computer chose #{@computer_code}"
      @status = :winner
      namer ; save_file ;leaderboard ; replay
    end


    def try_again(exact, partial)
      @final_time = (Time.now - @start_time).to_i
      puts "
      You have #{exact} exact match(es) and #{partial} partial match(es)"
      if @counter >= 12
        puts "#{@msg.game_over_msg} #{@msg.loose_msg}
      The computer chose #{@computer_code}            
      You  played the game for #{@final_time} seconds"
      replay
      end
    end

    def namer
      puts "#{@msg.namer_msg}"
      @name = user_input
    end

    def save_file
      File.open("game_results.txt", "a+") do | line |
        line.puts "#{@name} finished the game with #{@player_input} within #{@counter} rounds in #{@final_time} seconds"
      end
    end

    def leaderboard
      lead_arr = []
      File.open("game_results.txt", "r") do | lines |
       lines.each_line do |text|
        lead_arr << text
        @leader = lead_arr.sort_by { |line| line[/\d+ rounds/].to_i &&  line[/\d+ seconds/].to_i}
      end
      end
      puts "#{@leader.first(11  ).join.to_s}"
    end

  end #end class




end #end module