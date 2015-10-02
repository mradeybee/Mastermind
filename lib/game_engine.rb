module Mastermind

	class Game_Engine 
		# def exact_match(comp_copy, player_input)
		# 	comp_copy = Code_generator::Computer.dup
		# 			exact = 0
		# 			i = 0																			#
		# 			while i < 4										  					#
		# 				if comp_copy[i] == player_input[i]			#
		# 					exact += 1 														#   This looks for exact matches
		# 					comp_copy[i] = nil										#
		# 					player_input[i] = nil									#
		# 				end																			#
		# 				i += 1 																	#
		# 			end	
		# 			exact
		# end
		def exact_match(player_input)
			comp_copy = Code_generator::Computer.dup
					exact = 0
					i = 0																			#
					while i < 4										  					#
						if comp_copy[i] == player_input[i]			#
							exact += 1 														#   This looks for exact matches
							comp_copy[i] = nil										#
							player_input[i] = nil									#
						end																			#
						i += 1 																	#
					end	
					comp_copy
				end													    			#

		def partial_match(comp_copy, player_input)
			partial = 0
			i = 0																																	#
			sec_copy = comp_copy.dup																							#
			while i < 4																														#
				if !comp_copy[i].nil? && sec_copy.include?(player_input[i])					#
					partial += 1 																											#  This looks for partial matches
					comp_copy[i] = nil																								#
					player_input[i] = nil																							#
				end																																	#
					i += 1 																															#
			end
			partial   
		end		

		def game
			msg = Message.new
			count = 0
			start_time = Time.now
			comp_copy = Code_generator::Computer.dup
			loop do
				player_input = Player.new.player_entry
				final_time = (Time.now - start_time).to_i

				

				exact = exact_match(comp_copy, player_input) 
				partial = partial_match(exact, player_input)

				if count  > 10																							#
					puts "Game Over!"																					#
					puts ":( You Loose ):"
					puts "The computer chose #{Code_generator::Computer}	"																	# This checks if game is over
					puts "You  played the game for #{final_time} seconds"	
					exit																											
				elsif exact.count(nil) == exact.length 										#
					puts "#{msg.win_msg}"
					puts "You finished the game in #{final_time} seconds"																					#
					exit																													#
				elsif player_input == "h" 																		  #
						puts "You have missed a turn"																#																																																									#
				else																														#    User feedback section.
					puts "you have #{exact.count(nil)} exacts, #{partial} partial"						#
					puts " You have taken #{count + 1} guess out of 12"						#
				end																															#
					count += 1 																										#
				end

			end #end loop

		end #end function

	end #end class
