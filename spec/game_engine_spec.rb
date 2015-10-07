 require 'spec_helper'
# require 'pry'
describe Mastermind::Game_Engine do
  
  class Mastermind::Input
    def user_input
      input = "q"
    end
  end

  before :each do
    @game = Mastermind::Game_Engine.new(0)
    @input = Mastermind::Input.new
    @start = Mastermind::Starter.new
    @player = Mastermind::Player.new(0)
    @computer = Mastermind::Code_generator.new
    allow_message_expectations_on_nil
  end
  
  describe "#exact_match" do
    it 'returns exact matches'  do
      expect(@game.exact_match(["r","r","r","r"], ["r","r","r","r"])).to eql([[0, 0, 0, 0], 4])
    end
  end

  describe "#partial_match" do
    it 'returns partial matches'  do
      expect(@game.partial_match(["g", "y", "r", "b"], ["r", "g", "b", "y"])).to eql(4)
    end
  end
  describe "#replay" do
      it 'asks players to replay' do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@start).to receive(:difficulty).and_return(nil)
      expect{@game.replay}.to raise_error SystemExit
    end
  end






end