require 'spec_helper'

 describe Mastermind::Player do
 before do
    @player = Mastermind::Player.new
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
      expect(@player.is_valid?(["r", "t", "y", 1])).to be nil
    end
  end
end 