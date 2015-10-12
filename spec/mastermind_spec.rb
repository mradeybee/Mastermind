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
end
  


describe Input do
  include Input
    it 'has module Input ' do
      expect(user_input).not_to be nil
    end
end
