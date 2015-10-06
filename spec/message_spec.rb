 require 'spec_helper'

 describe Mastermind::Message do

  before do
    @message =  Mastermind::Message.new
    @red = "(r)ed".colorize(:color =>:red)
    @green = "(g)reen".colorize(:color =>:green)
    @blue = "(b)lue".colorize(:color =>:blue)
    @yellow = "(y)ellow".colorize(:color =>:yellow)
    @cyan = "(c)yan".colorize(:color =>:cyan)
    @magenta ="(m)agenta".colorize(:color => :magenta)
  end

 it 'displays message for long input' do
   expect(@message.too_long).to eql("Your input is too long")
  end 

   it 'displays message for short input' do
   expect(@message.too_short).to eql("Your input is too short")
  end 

  it 'displays difficulty select message' do
  expect(@message.difficulty_select).to eql("Select difficulty level, (b)eginner, (m)medium or (a)dvance")
  end

   it 'displays welcome message' do
    expect(@message.welcome_msg).to eql("Welcome to Mastermind")
  end
  it 'displays play message' do
    expect(@message.play_msg).to eql("Would you like to(p)lay, read the (i)nstructions or (q)uit?")
  end
   
   it 'displays beginer message' do
     expect(@message.beginer_msg).to eq("I have generated a beginner sequence with four elements made up of: #{@red}, #{@green}, #{@blue} and #{@yellow} Use (q)uit at any time to end the game.")
  end
   it 'displays intermidiate message' do
     expect(@message.play_msg).to eql("Would you like to(p)lay, read the (i)nstructions or (q)uit?")
   end
   it 'displays continuation message' do
  expect(@message.continue_msg).to eql("Press 'p' to play or 'q' to quit.")
  end

  it 'displays win message' do
   expect(@message.win_msg).to eql("********** You Win!!! **********")
   end

   it 'displays loose message' do
   expect(@message.loose_msg).to eql(":( You Loose ):")
   end

    it 'displays message for username' do
   expect(@message.name_msg).to eql("Enter your Name!")
  end 

   it 'displays hint limit message' do
   expect(@message.hint_exceeded_msg).to eql("You have exceeded your hint limit")
   end

   it 'displays quit message when user quits' do
    expect(@message.quit_msg).to eql( "You have quit the game")
  end

  
   it 'displays invalid entry' do
   expect(@message.invalid_entry_msg).to eql("Invalid entry, try again")
   end

  it 'displays advance select message' do
  expect(@message.advance_msg).to eql("I have generated an advance sequence with six elements made up of: #{@red}, #{@green}, #{@blue}, #{@yellow}, #{@cyan}, and #{@magenta}. Use (q)uit at any time to end the game.")
  end
  
  it 'displays message for play again' do
   expect(@message.play_msg).to eql("Would you like to(p)lay, read the (i)nstructions or (q)uit?")
  end 
end