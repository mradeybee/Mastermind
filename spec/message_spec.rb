 require 'spec_helper'

 describe Mastermind::Message do

  before :each do
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
     expect(@message.beginer_msg).to eq("I have generated a beginner sequence with four elements made up of: #{@red}, #{@green}, #{@blue} and #{@yellow} Use (h) to get hints, you have 1 hint. Use (q)uit at any time to end the game.")
  end
   it 'displays intermidiate message' do
     expect(@message.intermidiate_msg).to eql("I have generated an intermidiate sequence with six elements made up of: #{@red}, #{@green}, #{@blue}, #{@yellow} and #{@cyan}. Use (h) to get hints, you have 3 hint. Use (q)uit at any time to end the game.")
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

  it 'displays bye message' do
    expect(@message.bye).to eql("Thanks for playing! :)")
  end

  it 'displays message to ask for user name' do
    expect(@message.namer_msg).to eq("Enter your name")
  end
  
   it 'displays invalid entry' do
   expect(@message.invalid_entry_msg).to eql("Invalid entry, try again")
   end

  it 'displays advance select message' do
  expect(@message.advance_msg).to eql("I have generated an advance sequence with eight elements made up of: #{@red}, #{@green}, #{@blue}, #{@yellow}, #{@cyan}, and #{@magenta}. Use (h) to get hints, you have 5 hint. Use (q)uit at any time to end the game.")
  end
  
  it 'displays message for play again' do
   expect(@message.play_msg).to eql("Would you like to(p)lay, read the (i)nstructions or (q)uit?")
  end 

  it 'displays message wwhen game is over' do
   expect(@message.game_over_msg).to eql("Game Over!")
  end 

   it 'displays instruction message' do
   expect(@message.instruction_msg).to eql(
     <<-eos 
        This is Mastermind
        ** The Computer has chosen a set of colors, and the aim of the game is for you to find out those colors. 
        ** You can press (h) to get a clue to the get the Computer's choice at the cost of a turn. 
        ** You win when you guess all the Computer's choice correctly. 
        ** You loose if you dont get the correct computer's choice after 12 rounds. 
        ** Exact matches mean you guesed the right color at the right spot. 
        ** Partial matches mean you guesed the write color but not on the right spot. 
        *** Happy playing *** 
        eos
        )
  end
  it 'displays logo' do
   expect(@message.logo).to eql(
     "                                
           _____         _           _____ _       _ 
          |     |___ ___| |_ ___ ___|     |_|___ _| |
          | | | | .'|_ -|  _| -_|  _| | | | |   | . |
          |_|_|_|__,|___|_| |___|_| |_|_|_|_|_|_|___|"      
    )
  end
end