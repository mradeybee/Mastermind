module Mastermind
 class Player
  attr_reader :user_input
  def initialize(col)
    @msg = Message.new
    @input = Input.new
    @user_input = @input.user_input  
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
    @user_input
    if @user_input == "q"
      puts "#{@msg.quit_msg}"
      exit
    elsif @user_input == "h"
      hint(col)
    elsif @user_input.length > 4 + col
      puts "#{@msg.too_long}"
      player_entry(col)
    elsif @user_input.length < 4 + col
      puts "#{@msg.too_short}"
      player_entry(col)
    elsif is_valid?(@user_input.split(//))
      @user_input = @user_input.split(//)
    else
      puts "#{@msg.invalid_entry_msg}"
      player_entry(col)
    end 
  end 
 end #end class Player
end # end module
