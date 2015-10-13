require 'spec_helper'

include Mastermind::Difficulty
include Mastermind::Input
describe Mastermind::Difficulty do
    before :each do
      @input = Class.new.extend(Mastermind::Input)
      @difficulty = Class.new.extend(Mastermind::Difficulty)
      @gamer = Mastermind::Game_Engine.new(0)
    end

  describe "#difficulty" do
    it 'starts biginer level' do
      allow(@difficulty).to receive(:user_input).and_return("b")
      allow(@difficulty).to receive(:begin_game).and_return(nil)
      allow(@difficulty).to receive(:puts).and_return(nil)
      expect(@difficulty.difficulty).to be nil
    end
  
    it 'starts intermidiate level' do
      allow(@difficulty).to receive(:user_input).and_return("m")
      allow(@difficulty).to receive(:begin_game).and_return(nil)
      allow(@difficulty).to receive(:puts).and_return(nil)
      expect(@difficulty.difficulty).to be nil
    end

    it 'starts Advance level' do
      allow(@difficulty).to receive(:user_input).and_return("a")
      allow(@difficulty).to receive(:begin_game).and_return(nil)
      allow(@difficulty).to receive(:puts).and_return(nil)
      expect(@difficulty.difficulty).to be nil
    end
 
  it 'rejects invalid entry' do
    allow(@difficulty).to receive(:puts).and_return(nil)
    allow(@difficulty).to receive(:user_input).and_return("k")
    allow(@difficulty).to receive(:difficulty).and_return(nil)
    expect(@difficulty.difficulty).to eql(nil)
  end
end


 #  describe "#begin_game" do
 #    it 'starts the game' do
 #      allow(@difficulty)
 #      expect(@difficulty.begin_game(0)).to be nil
 #    end
 # end
end