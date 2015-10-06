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

  it 'allows replay' do 
    allow(@game).to receive(:replay).and_return('y')
  end

  it 'game returns winner' do 
    allow(@game).to receive(:game).and_return(:winner)
  end
  it 'prompts to try again' do 
    allow(@game).to receive(:analysis).and_return(:try_again)
  end

  it 'asks winners if they want to play again' do 
    allow(@game).to receive(:winner).and_return(:replay)
  end

  it 'asks loosers if they want to play again' do 
    allow(@pgame).to receive(:try_again).and_return(:replay)
  end
end
