require 'spec_helper'

include Mastermind::Difficulty
include Mastermind::Input
describe Mastermind::Difficulty do
    before :each do
      @input = Class.new.extend(Mastermind::Input)
      @difficulty = Class.new.extend(Mastermind::Difficulty)
      @gamer = Mastermind::Game_Engine.new
      @msg = Mastermind::Message.new
    end

  describe "#difficulty" do
    it 'starts biginer level' do
      allow(@difficulty).to receive(:user_input).and_return("b")
      allow(@difficulty).to receive(:puts).and_return(nil)
      allow(@difficulty).to receive(:game).and_return(nil)
      expect(@difficulty.difficulty(@msg)).to eq(0)
    end
  
    it 'starts intermidiate level' do
      allow(@difficulty).to receive(:user_input).and_return("m")
      allow(@difficulty).to receive(:game).and_return(nil)
      allow(@difficulty).to receive(:puts).and_return(nil)
      expect(@difficulty.difficulty(@msg)).to eq(2)
    end

    it 'starts Advance level' do
      allow(@difficulty).to receive(:user_input).and_return("a")
      allow(@difficulty).to receive(:game).and_return(nil)
      allow(@difficulty).to receive(:puts).and_return(nil)
      expect(@difficulty.difficulty(@msg)).to eq(4)
    end

    it 'rejects invalid entry' do
      allow(@difficulty).to receive(:user_input).and_return("k")
      allow(@difficulty).to receive(:puts).and_return(nil)
      allow(@difficulty).to receive(:non_valid).and_return(nil)
      expect(@difficulty.difficulty(@msg)).to eql(nil)
    end
 
  it 'rejects invalid entry' do
    allow(@difficulty).to receive(:user_input).and_return("k")
    allow(@difficulty).to receive(:puts).and_return(nil)
    allow(@difficulty).to receive(:difficulty).and_return(nil)
    expect(@difficulty.non_valid(@msg)).to eql(nil)
  end
end
end