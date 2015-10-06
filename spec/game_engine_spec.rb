 require 'spec_helper'

 describe Mastermind::Game_Engine do
  
  it 'returns exact matches'  do
    expect(Mastermind::Game_Engine.new(0).exact_match(["r","r","r","r"], ["r","r","r","r"])).to eql([[0, 0, 0, 0], 4])
  end
  it 'returns partial matches'  do
    expect(Mastermind::Game_Engine.new(0).partial_match(["g", "y", "r", "b"], ["r", "g", "b", "y"])).to eql(4)
  end

 end