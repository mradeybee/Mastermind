module Difficulty
  def difficulty
    puts "#{@msg.difficulty_select}"
    user_input = @input.user_input
    if user_input == "b"
      puts "#{@msg.beginer_msg}"
      col = 0
      begin_game(col)

    elsif user_input == "m"
      puts "#{@msg.intermidiate_msg}"
      col = 2
      begin_game(col)
    elsif user_input == "a"
      puts "#{@msg.advance_msg}"
      col = 4
      begin_game(col) 
    else
        puts "#{@msg.invalid_entry_msg}"
        difficulty
    end
  end
end
