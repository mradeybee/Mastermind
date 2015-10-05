require 'spec_helper'

describe Mastermind do
  it 'has a version number' do
    expect(Mastermind::VERSION).not_to be nil
  end

  it 'has class game_engine' do
    expect(Mastermind::Game_Engine).not_to be nil
  end

  it 'has class code_generator' do
    expect(Mastermind::Code_generator).not_to be nil
  end

  it 'has class player' do
    expect(Mastermind::Player).not_to be nil
    end
  it 'has class message' do
    expect(Mastermind::Message).not_to be nil
    end
  it 'has class starter' do 
    expect(Mastermind::Starter).not_to be nil
  end
  it 'has class input' do
    expect(Mastermind::Input).not_to be nil
  end
  it 'displays welcome message' do
    expect(Mastermind::Message.new.welcome_msg).to eql("Welcome to Mastermind")
  end
  it 'displays play message' do
    expect(Mastermind::Message.new.play_msg).to eql("Would you like to(p)lay, read the (i)nstructions or (q)uit?")
  end
  it 'displays difficulty select message' do
  expect(Mastermind::Message.new.difficulty_select).to eql("Select difficulty level, (b)eginner, (m)medium or (a)dvance")
  end 
  it 'has a valid user input' do
    expect(Mastermind::Player.new.is_valid?(["r","g", "b", "y"])).to be true
  end

  it 'rejects invalid input' do
    expect(Mastermind::Player.new.is_valid?(["r", "t", "y", 1])).to be false
  end

  it 'returns exact matches'  do
    expect(Mastermind::Game_Engine.new(0).exact_match(["r","r","r","r"], ["r","r","r","r"])).to eql([[0, 0, 0, 0], 4])
  end
  it 'returns partial matches'  do
    expect(Mastermind::Game_Engine.new(0).partial_match(["g", "y", "r", "b"], ["r", "g", "b", "y"])).to eql(4)
  end
  it 'displays beginer message' do
    expect(Mastermind::Message.new.beginer_msg).to eql("I have generated a beginner sequence with four elements made up of:
    #{@red}, #{@green}, #{@blue} and #{@yellow} Use (q)uit at any time to end the game.")
  end
  it 'displays intermidiate message' do
    expect(Mastermind::Message.new.play_msg).to eql("Would you like to(p)lay, read the (i)nstructions or (q)uit?")
  end
  it 'displays advance select message' do
  expect(Mastermind::Message.new.advance_mgs).to eql("I have generated an advance sequence with six elements made up of:
  #{@red}, #{@green}, #{@blue}, #{@yellow}, #{@cyan}, and #{@magenta}. Use (q)uit at any time to end the game.")
  end 
  it 'displays message for play again' do
  expect(Mastermind::Message.new.play_msg).to eql("Would you like to(p)lay, read the (i)nstructions or (q)uit?")
  end 
end
