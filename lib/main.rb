require "colorize"
module Mastermind
##########################################
# This is the starter class. The promps at 
# the begining of the game are being called 
# here
##########################################
	class Starter
		def initialize 
			@msg = Message.new
			@input = Input.new
		end 

		def welcome
			puts "#{@msg.logo}"
			puts "#{@msg.welcome_msg}"
			puts "#{@msg.play_msg}"
		end

		def instructions
			puts "#{@msg.instruction_msg}"
			puts "#{@msg.continue_msg}"
			ask
		end

		def ask
			user_input = @input.user_input
			if user_input == "p"
				difficulty
			elsif user_input == "q"
				puts "#{@msg.quit_msg}"
				exit
			elsif user_input == "i"
				instructions
			else
					puts "#{@msg.invalid_entry_msg}"
					ask
			end
		end

		def difficulty
			puts "#{@msg.difficulty_select}"
			user_input = @input.user_input
			if user_input == "b"
				puts "#{@msg.beginer_msg}"
				col = 0
				begin_game(col)

			elsif user_input == "m"
				puts "#{@msg.intermidiate_msg}"
				col = 1
				begin_game(col)
			elsif user_input == "a"
				puts "#{@msg.advance_msg}"
				col = 2
				begin_game(col)	
			else
					puts "#{@msg.invalid_entry_msg}"
					difficulty
			end
		end

		def begin_game(col)
			@game_starter = Game_Engine.new(col)
			@game_starter.game(col)
		end

	end # end class Starter
end # end module