require_relative "computer"
require "colorize"
module Mastermind

####################################
#This is the user input class. All 
#	inputs from the user is generated
# by this class
#####################################


	class Input
		attr_reader :user_input
		def initialize
			@user_input = gets.chomp.downcase
		end
	end

#########################################
# This is the messages class. Most of 
# the messages used in this 
# application can be found in this class. 
#########################################

	class Message
		# attribute readers
		attr_reader :welcome_msg, :start_msg, :guess_msg, :win_msg, :loose_msg, :exact_msg_one,
		:start_msg, :quit_msg, :invalid_entry_msg, :hint_exceeded_msg, :hint_msg, :game_over_msg,
		:exact_msg_many, :instruction_msg, :continue_msg, :beginer_msg, :difficulty_select, :intermidiate_msg,
		:advance_msg, :partial_msg_one, :partial_msg_many, :exact, :partial, :logo
		# attribute writers
		attr_writer :exact, :partial


		def initialize
			@exact = 0
			@partial = 0
			h = Random.rand (1..4)
			computer_choice = 0
			computer_input = 0
			red = "(r)ed".colorize(:color =>:red)
			green = "(g)reen".colorize(:color =>:green)
			blue = "(b)lue".colorize(:color =>:blue)
			yellow = "(y)ellow".colorize(:color =>:yellow)
			cyan = "(c)yan".colorize(:color =>:cyan)
			magenta ="(m)agenta".colorize(:color => :magenta)

			def difficult_select
				difficulty_select = "Select difficulty level, (1) for beginner, (2) for intermidiate (3) for advance "
			end
			@welcome_msg = "
					Welcome to Mastermind
		
			Would you like to(p)lay, read the (i)nstructions or (q)uit?"
			@beginer_msg = "
			I have generated a beginner sequence with four elements made up of:
			#{red}, #{green}, #{blue} and #{yellow} Use (q)uit at any time to end the game."
			@intermidiate_msg = "
			I have generated an intermidiate sequence with four elements made up of:
			#{red}, #{green}, #{blue}, #{yellow}, #{cyan}, and #{magenta}, Use (q)uit at any time to end the game."
			@advance_msg = "
			I have generated an advance sequence with four elements made up of: 
			#{red},#{red}, #{red}, and #{red},. Use (q)uit at any time to end the game."
			@continue_msg = "
			Press 'p' to play or 'q' to quit."
			@continue_msg = "
			Press 'p' to play or 'q' to quit."
			@start_msg = "
			The game has started. Enter 'quit' to end the game at any point"
			@guess_msg = "
			Enter your gueses"
			@win_msg = "
			********** You Win!!! **********"
			@loose_msg = "
			:( You Loose ):"
			@exact_msg_one = "
			You have 1 exact match"
			@exact_msg_many = "
			You have #{@exact} exact matches"
			@partial_msg_one = "
			You have 1 partial match"
			@partial_msg_many = "
			#{@partial} partial matches"
			@hint_msg = "
			#{Code_generator::Computer[h - 1]} is at position #{h} in the computer's choice"
			@hint_exceeded_msg = "
			You have exceeded your hint limit"
			@name_msg = "
			Enter your Name!"
			@quit_msg = "
			You have quit the game"
			@invalid_entry_msg = "
			Invalid entry, try again"
			@game_over_msg = "
			Game Over! The computer chose #{computer_input}"
			@instruction_msg = <<-eos 
			This is Mastermind
			** The Computer has chosen a set of colors, and the aim of the game is for you to find out those colors. 
			** You can press (h) to get a clue to the get the Computer's choice at the cost of a turn. 
			** You win when you guess all the Computer's choice correctly. 
			** You loose if you dont get the correct computer's choice after 12 rounds. 
			** Exact matches mean you guesed the right color at the right spot. 
			** Partial matches mean you guesed the write color but not on the right spot. 
			*** Happy playing *** 
			eos
			@logo = "                                          
				 _____         _           _____ _       _ 
				|     |___ ___| |_ ___ ___|     |_|___ _| |
				| | | | .'|_ -|  _| -_|  _| | | | |   | . |
				|_|_|_|__,|___|_| |___|_| |_|_|_|_|_|_|___|"                                                    
		end
	end


##########################################
# This is the starter class. The promps at 
# the begining of the game are being called 
# here
##########################################


	class Starter
		def initialize 
			@msg = Message.new

		end 

		# Welcome Message
		def welcome
			puts "#{@msg.logo}"
			puts "#{@msg.welcome_msg}"
		end

		# Game Instructions
		def instructions
			puts "#{@msg.instruction_msg}"
			puts "#{@msg.continue_msg}"
			ask
		end


		# Difficulty Level
		def difficulty

		
			puts "#{@msg.difficulty_select}"
			input = Input.new	
			user_input = input.user_input.to_i

			# Difficulty level selector
			if user_input == 1
				puts "#{@msg.beginer_msg}"
				character = 0
				col = 0
				Game_Engine.new.game
			elsif user_input == 2
				puts "#{@msg.intermidiate_msg}"
				character = 2
				col = 1
			elsif user_input == 3
				puts "#{@msg.advance_msg}"
				character = 4
				col = 2
			elsif user_input != 1 || user_input != 2 || user_input != 3
				loop do
					puts "#{@msg.invalid_entry_msg}"
					input = Input.new	
					user_input = input.user_input
				end				
			end

		end

		# This prompts for user's choice
		def ask

				
			input = Input.new	
			user_input = input.user_input

			if user_input == "p"
				difficulty
			elsif user_input == "q"
				puts "#{@msg.quit_msg}"
				exit
			elsif user_input == "i"
				instructions
			elsif user_input != "q" || user_input != "p"
					loop do
					puts "#{@msg.invalid_entry_msg}"
					input = Input.new	
					user_input = input.user_input
					if user_input == "q"
						puts "#{@msg.quit_msg}"
						exit
					elsif user_input == "p"
						difficulty
						break
					end
				end
			end

		end # end ask

	end # end class Starter

end # end module