module Mastermind
 class Player
  def initialize(col)
    @computer_code = Code_generator.new.computer_choice(col)
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
  def player_entry(col = 0)
   msg = Message.new
   input = Input.new
   user_input = input.user_input 
    if user_input == "q"
      puts "#{msg.quit_msg}"
      exit
    elsif user_input == "h"
      hint(col)
    elsif user_input.length > 4 + col
      puts "#{msg.too_long}"
      player_entry(col)
      elsif user_input.length < 4 + col
      puts "#{msg.too_short}"
      player_entry(col)
    elsif is_valid?(user_input.split(//))
     user_input = user_input.split(//)
    else
     puts "#{msg.invalid_entry_msg}"
     player_entry(col)
    end 
  end 

  # This gives the player a clue to computer's choice
  def hint(col)
   msg = Message.new
   col_val = 1 + col
   c_num = 0
   h = rand(1...4)
   if c_num >= 1 + col_val
         puts "#{msg.hint_exceeded_msg}"  
       else 
         puts "#{@computer_code[h - 1]} is at position #{h} in the computer's choice"
         h = Random.rand(1..4)
         c_num = c_num + 1
         player_entry(col)
     end
  end #end hint

 end #end class Player
end # end module
