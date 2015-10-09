require "colorize"
require_relative 'input'
require_relative 'difficulty'

module Mastermind
##########################################
# This is the starter class. The promps at 
# the begining of the game are being called 
# here
##########################################
	class Starter

		include Input
		include Difficulty

		def initialize 
			@msg = Message.new
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
			input = user_input
			case 
			when input == "p"
				difficulty 	
			when input == "q"
				puts "#{@msg.quit_msg}"
				exit
			when input == "i"
				instructions
			else
					puts "#{@msg.invalid_entry_msg}"
					ask
			end
		end
		
	

	end # end class Starter
end # end module