require 'spec_helper'

 describe Mastermind::Starter do
  before :each do
    @start = Mastermind::Starter.new
    allow_message_expectations_on_nil 
  end

  it 'display welcome message' do
    allow(@start).to receive(:puts).and_return(nil)
    expect(@start.welcome).to be (nil)
  end

  it 'prints logo' do
    allow(@start).to receive(:puts).and_return(nil)
    expect(@start.welcome).to be nil     
  end

   it 'asks the user to play game, quit game or read instruction' do
    allow(@start).to receive(:puts).and_return(nil)
    allow(@start).to receive(:ask).and_return(nil)
    expect(@start.ask).to be nil
  end

  it 'allows user to choose to read instructions' do
    allow(@start).to receive(:user_input).and_return("i")
    allow(@start).to receive(:puts).and_return(nil)
    allow(@start).to receive(:instructions).and_return(nil)
    expect(@start.ask).to be nil
    end

    it 'asks user to proceed to play after reading instructions' do
      allow(@start).to receive(:ask).and_return(nil)
      allow(@start).to receive(:puts).and_return(nil)
      expect(@start.instructions).to be nil
    end

    it 'asks users to select difficulty level' do
      allow(@start).to receive(:user_input).and_return("p")
      allow(@start).to receive(:difficulty).and_return(nil)
      expect(@start.ask).to eq(nil)
    end

    it 'allows users to quit the game' do
      allow(@start).to receive(:user_input).and_return("q")
      expect{@start.ask}.to raise_error SystemExit
    end

    it 'throws an error message if invalid entry is made' do
      allow(@start).to receive(:user_input).and_return("k")
      allow(@start).to receive(:ask).and_return(nil)
      expect(@start.ask).to be nil
    end

  
end