require 'spec_helper'

 describe Mastermind::Player do
 before do
    @player = Mastermind::Player.new(0)
  end
  describe "#is_valid?" do
    it 'takes user input' do 
      allow(@player).to receive(:player_entry).and_return(["r","r","r","r"])
      expect(@player.player_entry).to eq(["r","r","r","r"])
    end

    it 'validates user input' do
      expect(@player.is_valid?(["r","g", "b", "y"])).to be true
    end

    it 'rejects invalid input' do
      expect(@player.is_valid?(["r", "t", "y", 1])).to be false
    end
  end

  describe "#player_entry" do
    it 'rejects shot entries' do
      # allow(@player).to receive(:player_entry).and_return(nil)
      allow(@player.player_entry(0)).to receive(:user_input).and_return("rrrr")
      expect(@player.player_entry(0)).to eq("Your input is too short")
    end
  end
end 