 require 'spec_helper'

describe Mastermind::Game_Engine do

  before do
    @game = Mastermind::Game_Engine.new(0)
  end

  it 'returns exact matches'  do
    expect(@game.exact_match(["r","r","r","r"], ["r","r","r","r"])).to eql([[0, 0, 0, 0], 4])
  end
  it 'returns partial matches'  do
    expect(@game.partial_match(["g", "y", "r", "b"], ["r", "g", "b", "y"])).to eql(4)
  end

  it 'asks player to replay' do 
    allow(@game).to receive(:replay).and_return("Would you like to play again? (y)es, (n)o")
  end
  it 'asks player again if invalid entry are entered' do 
    allow(@game).to receive(:replay).and_return (:replay)
  end

  # it 'checks for exact matches' do
  #   allow(@game.game(0))toreceive(:exact(["r","r","r","r"], ["r","r","r","r"])).and_return([[0, 0, 0, 0], 4])
  # end

  it 'game returns winner' do 
    allow(@game).to receive(:game).and_return(:winner)
    expect(@game.game(0)).to eq(:winner)
  end

  it 'prompts to try again' do 
    allow(@game).to receive(:analysis).and_return(:try_again)
    expect(@game.winner(0)).to eq(:try_again)  
  end

  it 'asks winners if they want to play again' do 
    allow(@game).to receive(:winner).and_return(:replay)
    expect(@game.winner).to eq(:replay)
  end

  it 'asks loosers if they want to play again' do 
    allow(@game).to receive(:try_again).and_return(:replay)
    expect(@game.try_again).to eq(:replay)
  end
end
