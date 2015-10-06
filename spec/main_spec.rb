require 'spec_helper'

 describe Mastermind::Starter do
  before do
    @start = Mastermind::Starter.new
  end

  it 'display welcome message' do
    allow(@start).to receive(:puts).and_return(nil)
    expect(@start.welcome).to be (nil)
  end

  it 'prints logo' do
    allow(@start).to receive(:welcome).and_return(
      "                                
           _____         _           _____ _       _ 
          |     |___ ___| |_ ___ ___|     |_|___ _| |
          | | | | .'|_ -|  _| -_|  _| | | | |   | . |
          |_|_|_|__,|___|_| |___|_| |_|_|_|_|_|_|___|"
      )
  end

   it 'asks the user to play game, quit game or read instruction' do
    allow(@start).to receive(:welcome).and_return( "Would you like to(p)lay, read the (i)nstructions or (q)uit?")
  end

  it 'display instructions for users' do
    allow(@start).to receive(:instructions).and_return( 
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

    it 'asks user to proceed to play after reading instructions' do
      allow(@start).to receive(:instructions).and_return("Press 'p' to play or 'q' to quit.")
      expect(@start.instructions).to eql("Press 'p' to play or 'q' to quit.")
    end

    it 'asks users to select difficulty level' do
      allow(@start).to receive(:ask).and_return(nil)
      expect(@start.ask).to eq(nil)
    end

    it 'allows users to quit the game' do
      allow(@start).to receive(:ask).and_return(:quit)
      expect(@start.ask).to eq(:quit)
    end

    it 'allows user to choose to read instructions' do
      allow(@start).to receive(:ask).and_return(:instructions)
    end

    it 'throws an error message if invalid entry is made' do
      allow(@start).to receive(:ask).and_return("Invalid entry, try again")
    end

    it 'slects beginer difficulty level' do
       allow(@start).to receive(:difficulty).and_return(0)        
      end

    it 'slects intermidiate difficulty level' do
       allow(@start).to receive(:difficulty).and_return(1)
      end

    it 'shows beginer difficulty level message' do
       allow(@start).to receive(:difficulty).and_return("I have generated a beginner sequence with four elements made up of: #{@red}, #{@green}, #{@blue} and #{@yellow} Use (q)uit at any time to end the game.")        
      end

      it 'shows intermidiate difficulty level message' do
       allow(@start).to receive(:difficulty).and_return("I have generated an intermidiate sequence with five elements made up of: #{@red}, #{@green}, #{@blue}, #{@yellow} and #{@cyan}. Use (q)uit at any time to end the game.")        
      end

    it 'shows advance difficulty level message' do
      allow(@start).to receive(:difficulty).and_return("I have generated a beginner sequence with four elements made up of: #{@red}, #{@green}, #{@blue} and #{@yellow} Use (q)uit at any time to end the game.")        
     end
end