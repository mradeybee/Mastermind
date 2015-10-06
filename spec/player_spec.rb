require 'spec_helper'

 describe Mastermind::Player do

   it 'takes user input' do 
    allow(Mastermind::Player.new).to receive(:player_entry).and_return(["r","r","r","r"])
  end

  it 'validates user input' do
    expect(Mastermind::Player.new.is_valid?(["r","g", "b", "y"])).to be true
  end

  it 'rejects invalid input' do
    expect(Mastermind::Player.new.is_valid?(["r", "t", "y", 1])).to be false
  end

  
end