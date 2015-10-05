module Mastermind
	class Message
			# attribute readers
			attr_reader :welcome_msg, :start_msg, :guess_msg, :win_msg, :loose_msg, :exact_msg_one,
			:start_msg, :quit_msg, :invalid_entry_msg, :hint_exceeded_msg, :hint_msg, :game_over_msg,
			:exact_msg_many, :instruction_msg, :continue_msg, :beginer_msg, :difficulty_select, :intermidiate_msg,
			:advance_msg, :partial_msg_one, :partial_msg_many, :exact, :partial, :logo, :too_long,:too_short, :play_msg

			def initialize
				red = "(r)ed".colorize(:color =>:red)
				green = "(g)reen".colorize(:color =>:green)
				blue = "(b)lue".colorize(:color =>:blue)
				yellow = "(y)ellow".colorize(:color =>:yellow)
				cyan = "(c)yan".colorize(:color =>:cyan)
				magenta ="(m)agenta".colorize(:color => :magenta)
				@too_long ="You input is too long"
				@too_short ="You input is too short"
				@difficulty_select = "Select difficulty level, (b)eginner, (m)medium or (a)dvance"
				@welcome_msg = "Welcome to Mastermind"
				@play_msg = "Would you like to(p)lay, read the (i)nstructions or (q)uit?"
				@beginer_msg = "I have generated a beginner sequence with four elements made up of:
				#{red}, #{green}, #{blue} and #{yellow} Use (q)uit at any time to end the game."
				@intermidiate_msg = "I have generated an intermidiate sequence with five elements made up of:
				#{red}, #{green}, #{blue}, #{yellow} and #{cyan}. Use (q)uit at any time to end the game."
				@advance_msg = "I have generated an advance sequence with six elements made up of: 
				#{red}, #{green}, #{blue}, #{yellow}, #{cyan}, and #{magenta}. Use (q)uit at any time to end the game."
				@continue_msg = "Press 'p' to play or 'q' to quit."
				@continue_msg = "Press 'p' to play or 'q' to quit."
				@start_msg = "The game has started. Enter 'quit' to end the game at any point"
				@guess_msg = "Enter your gueses"
				@win_msg = "********** You Win!!! **********"
				@loose_msg = ":( You Loose ):"
				@exact_msg_one = "You have 1 exact match"
				@exact_msg_many = "You have #{@exact} exact matches"
				@partial_msg_one = "You have 1 partial match"
				@partial_msg_many = "#{@partial} partial matches"
				@hint_exceeded_msg = "You have exceeded your hint limit"
				@name_msg = "Enter your Name!"
				@quit_msg = "You have quit the game"
				@invalid_entry_msg = "Invalid entry, try again"
				@game_over_msg = "Game Over!"
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
end