module Mastermind

	class Game_Engine 

		attr_reader :status

		def initialize(col=nil)
			starter = Starter.new
			@computer_code = Code_generator.new.computer_choice(col)
			@player = Player.new
			@msg = Message.new
			@status = :started
		end

		def game(col)
			@count = 0
			@start_time = Time.now
			loop do
				player_input = @player.player_entry(col)
				@exact = exact_match(@computer_code, player_input) 
				@partial = partial_match(@exact, player_input)
				@count += 1

				analysis(player_input)

				break if @count >= 12 || @status == :winner
			end
		end

		def analysis(player_input)
			puts "
			You entered #{player_input}"
			winner if (@exact.count(nil) == @exact.length)
			try_again unless @status == :winner
		end

		def winner
			final_time = (Time.now - @start_time).to_i
			puts "
			Champ you're brilliant. You won in #{final_time} seconds"
			@status = :winner
		end

		def try_again
			puts "
			You have #{@exact.count(nil)} exact matches and #{@partial} partial matches"
			if @count >= 12
				puts "Game Over!																			
				:( You Loose ):
				The computer chose #{@computer_code}						
				You  played the game for #{final_time} seconds"
			end
		end

		def exact_match(computer_code, player_input)
			comp_copy = computer_code.dup
			exact = 0
			i = 0													  					#
			while i < comp_copy.length	  	  				#
				if comp_copy[i] == player_input[i]			#
					exact += 1 														#   This looks for exact matches
					comp_copy[i] = nil										#
				end																		  #
				i += 1 																  #
			end	
			comp_copy
		end													    			

		def partial_match(comp_copy, player_input)
			partial = 0
			i = 0																																	#
			sec_copy = comp_copy.dup																							#
			while i < sec_copy.length																							#
				if !comp_copy[i].nil? && sec_copy.include?(player_input[i])					#
					partial += 1 																											#  This looks for partial matches
					comp_copy[i] = nil																								#
				end																																	#
					i += 1 																														#
			end
			partial   
		end		

		# def feedback(time, exact, partial, count)
		# 	final_time = (Time.now - time).to_i
		# 		if count  > 10	
		# 			puts "Game Over!																			
		# 				    :( You Loose ):
		# 					  The computer chose #{@computer_code}						
		# 					  You  played the game for #{final_time} seconds"	
		# 						exit																											
		# 		elsif exact.count(nil) == exact.length 										
		# 			puts "#{msg.win_msg}
		# 						You finished the game in #{final_time} seconds"		
		# 			exit																										
		# 		elsif player_input == "h" 																
		# 				puts "You have missed a turn"																																																																						#
		# 		else																											
		# 			puts "you have #{exact} exacts, #{partial} partials
		# 						You have taken #{count} guess out of 12"						
		# 		end																															 																										
		# 	end
	end #end class

end #end module
