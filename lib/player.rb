module MyMastermind
	class Player

		# This Validates user input 
		def is_valid?(input)
			code = ["r","g","b","y","p","v"]
			arr = []
			for i in input
				arr << i if code.include?(i)
			end
			arr
			if arr == input 
			  true
			else
			  false
			end
		end

		# This evaluates the user entry 
		def player_entry
			msg = Message.new
			input = Input.new
			h = Random.rand(1..4)
				user_input = input.user_input	
				if user_input == "q"
						puts "#{msg.quit_msg}"
						exit
				elsif user_input == "h"
						hint
				elsif user_input.length != 4
						puts "#{msg.invalid_entry_msg}"
						player_entry
				elsif is_valid?(user_input.split(//))
					user_input = user_input.split(//)
				else
					puts "#{msg.invalid_entry_msg}"
					player_entry
				end
				player_input = user_input
		end	

		# This gives the player a clue to computer's choice
		def hint
			msg = Message.new
			c_num = 0
			if c_num > 1
			    		puts "#{msg.hint_exceeded_msg}#{user_input}" 	
			    elsif 
				    	puts "#{msg.hint_msg}"
				    	h = Random.rand(1..4)
				    	c_num = c_num + 1
				    	player_entry
					end
		end #end hint

	end #end class Player
end # end module