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

   describe "#player_entry" do
    it 'quits if player enters q' do
      allow(@player).to receive(:user_input).and_return("q")
      allow(@player).to receive(:puts).and_return(nil)
      expect{@player.player_entry(0,["r","r","r","r"])}.to raise_error SystemExit
    end

    it 'shows hint' do
      allow(@player).to receive(:user_input).and_return("h")
      allow(@player).to receive(:hint).and_return(nil)
      allow(@player).to receive(:puts).and_return(nil)
      expect(@player.player_entry(0,["r","r","r","r"])).to be nil 
    end

    it 'turns user input into an array' do
      allow(@player).to receive(:user_input).and_return("rrrr")
      expect(@player.player_entry(0,["r","r","r","r"])).to eql(["r","r","r","r"])
    end
  end

  # it 'detects short inputs' do
  #     allow(@player).to receive(:user_input).and_return("rrr")
  #     expect(@player.player_entry(0,["r","r","r","r"])).to eql(["r","r","r","r"])
  #   end

  describe "#hint" do
    it 'gets hint' do
      allow(@player).to receive(:puts).and_return (nil)
      allow(@player).to receive(:player_entry).and_return (nil)
      expect(@player.hint(0,["r","r","r","r"])).to be nil
    end
  end
end 