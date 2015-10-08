module Mastermind
 class Player
  attr_reader :input
  def initialize
    @h_num = 0
    @msg = Message.new
    @input = Input.new
  end
  # This Validates user input 
  def is_valid?(input)
   code = ["r","g","b","y","c","m"]
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
  def player_entry(col, computer_code)
   user_input = @input.user_input 
    if user_input == "q"
      puts "#{@msg.quit_msg}"
      exit
    elsif user_input == "h"
      if  @h_num < col + 1
        @h_num += 1
        hint(col, computer_code)
      else 
        puts "#{@msg.hint_exceeded_msg}"
        player_entry(col, computer_code)
      end
    elsif user_input.length > 4 + col
      puts "#{@msg.too_long}"
      player_entry(col, computer_code)
    elsif user_input.length < 4 + col
      puts "#{@msg.too_short}"
      player_entry(col, computer_code)
    elsif is_valid?(user_input.split(//))
     user_input = user_input.split(//)
    else
     puts "#{@msg.invalid_entry_msg}"
     player_entry(col,computer_code)
    end   
  end 

  # This gives the player a clue to computer's choice
  def hint(col, computer_code)
    h = rand(1..4)
    puts "#{computer_code[h - 1]} is at position #{h} in the computer's choice"
    h = rand(1..4)
    player_entry(col,computer_code)
  end #end hint

 end #end class Player
end # end module
