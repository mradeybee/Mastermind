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

   it 'displays results' do
  expect(@message.result(2,2)).to eql("You have 2 exact match(es) and 2 partial match(es)")
  end

   it 'writes to leaderboard file' do
  expect(@message.leader_msg("Bayo", "rrrr", 2, 20)).to eql("Bayo guessed the sequence rrrr in 2 rounds within 20 seconds")
  end

   it 'displays number of rouds played' do
  expect(@message.rounds("rrrr",2)).to eql( "You played rrrr. Round 2 0f 12")
  end

  it 'displays Computer\'s choice' do
  expect(@message.comp_choice_msg("rrrr")).to eql("The computer chose rrrr")
  end

  it 'displays difficulty select message' do
  expect(@message.difficulty_select).to eql("Select difficulty level, (b)eginner, (m)medium or (a)dvance")
  end

   it 'displays welcome message' do
    expect(@message.welcome_msg).to eql("Welcome to Mastermind")
  end
  it 'displays play message' do
    expect(@message.play_msg).to eql("Press (p) to play, (i) to read the (i)nstructions, (l) to view leaderboard  or (q) to quit?")
  end
   
   it 'displays beginer message' do
     expect(@message.beginer_msg).to eq("I have generated a beginner sequence with four elements made up of: #{@red}, #{@green}, #{@blue} and #{@yellow} Use (h) to get hints, you have 1 hint. Use (q)uit at any time to end the game.")
  end
   it 'displays intermidiate message' do
     expect(@message.intermidiate_msg).to eql( "I have generated an intermidiate sequence with six elements made up of: #{@red}, #{@green}, #{@blue}, #{@yellow}, #{@cyan}and #{@magenta}. Use (h) to get hints, you have 3 hint. Use (q)uit at any time to end the game.")
   end

  it 'displays win message' do
   expect(@message.win_msg(23, 5, "rrrr")).to eql("********** You Win!!! **********
        You won in 23 seconds within 5 rounds
        The computer chose rrrr")
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

   it 'displays hint message' do
    expect(@message.hint_msg(2, ["r","r","r","r"])).to eql("r is at position 2 in the computer's choice" )
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

  it 'displays message wwhen game is over' do
    code = ["r","r","r","r"]
   expect(@message.game_over_msg(["r","r","r","r"], 20)).to eql("Game Over!
       :( You Loose ):
       The computer chose #{code}
       You  played the game for 20 seconds")
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