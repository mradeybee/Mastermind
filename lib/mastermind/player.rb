require_relative 'input'

module Mastermind

 class Player

  include Input

  attr_reader :input

  def initialize
    @h_num = 0
    @msg = Message.new
    @code = ["r","g","b","y","c","m"]
  end

  # This Validates user input 
  def is_valid?(incode)
     arr = []
    for i in incode
      arr << i if @code.include?(i)
    end
    arr
    true if arr == incode 
  end

  # This evaluates the user entry 
  def player_entry(col, computer_code)
    input = user_input
    case
    when input == "q"
      puts "#{@msg.quit_msg}"
      exit
   
    when input == "h"
      if  @h_num < col + 1
        @h_num += 1
        hint(col, computer_code)
      else 
        puts "#{@msg.hint_exceeded_msg}"
        player_entry(col, computer_code)
      end

    when input.length > 4 + col
      puts "#{@msg.too_long}"
      player_entry(col, computer_code)

    when input.length < 4 + col
      puts "#{@msg.too_short}"
      player_entry(col, computer_code)

    when is_valid?(input.split(//))
      input = input.split(//)

    else
      puts "#{@msg.invalid_entry_msg}"
      player_entry(col,computer_code)
    end   
  end 

  # This gives the player a clue to computer's choice
  def hint(col, computer_code)
    h = rand(1..4)
    puts "#{@msg.hint_msg(h, computer_codes)}"
    h = rand(1..4)
    player_entry(col,computer_code)
  end #end hint

 end #end class Player
end # end module
