module Mastermind
	class Message
			# attribute readers
			def initialize
				@red = "(r)ed".colorize(:color =>:red)
				@green = "(g)reen".colorize(:color =>:green)
				@blue = "(b)lue".colorize(:color =>:blue)
				@yellow = "(y)ellow".colorize(:color =>:yellow)
				@cyan = "(c)yan".colorize(:color =>:cyan)
				@magenta ="(m)agenta".colorize(:color => :magenta)
			end

			def too_long 
				"You input is too long"
			end

			def too_short 
				"You input is too short"
			end

			def difficulty_select
				"Select difficulty level, (b)eginner, (m)medium or (a)dvance"
			end

			def welcome_msg
				
					"Welcome to Mastermind"
			end

			def play_msg
				"Would you like to(p)lay, read the (i)nstructions or (q)uit?"
			end
				
			def beginer_msg 
				"I have generated a beginner sequence with four elements made up of: #{@red}, #{@green}, #{@blue} and #{@yellow} Use (q)uit at any time to end the game."
			end 

			def intermidiate_msg
				"I have generated an intermidiate sequence with five elements made up of:
				#{@red}, #{@green}, #{@blue}, #{@yellow} and #{@cyan}. Use (q)uit at any time to end the game."
			end

			def advance_msg 
				"I have generated an advance sequence with six elements made up of: #{@red}, #{@green}, #{@blue}, #{@yellow}, #{@cyan}, and #{@magenta}. Use (q)uit at any time to end the game."
			end

			def continue_msg 
				"Press 'p' to play or 'q' to quit."
			end

			def continue_msg 
				"Press 'p' to play or 'q' to quit."
			end

			def start_msg 
				"The game has started. Enter 'quit' to end the game at any point"
			end

			def guess_msg 
				"Enter your gueses"
			end

			def win_msg 
				"********** You Win!!! **********"
			end

			def loose_msg 
				":( You Loose ):"
			end

			def exact_msg_one 
			 "You have 1 exact match"
			end

			def exact_msg_many 
				"You have #{@exact} exact matches"
			end

			def partial_msg_one 
				"You have 1 partial match"
			end

			def partial_msg_many
				"#{@partial} partial matches"
			end

			def hint_exceeded_msg
				"You have exceeded your hint limit"
			end

			def name_msg
			 "Enter your Name!"
			end

			def quit_msg
			 "You have quit the game"
			end

			def invalid_entry_msg
			 "Invalid entry, try again"
			end

			def game_over_msg
			 "Game Over!"
			end

			def instruction_msg 
				<<-eos 
				This is Mastermind
				** The Computer has chosen a set of colors, and the aim of the game is for you to find out those colors. 
				** You can press (h) to get a clue to the get the Computer's choice at the cost of a turn. 
				** You win when you guess all the Computer's choice correctly. 
				** You loose if you dont get the correct computer's choice after 12 rounds. 
				** Exact matches mean you guesed the right color at the right spot. 
				** Partial matches mean you guesed the write color but not on the right spot. 
				*** Happy playing *** 
				eos
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