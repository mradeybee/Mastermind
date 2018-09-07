require 'spec_helper'

describe Mastermind do
  it 'has a version number' do
    expect(Mastermind::VERSION).not_to be nil
  end

  it 'has class game engine' do
    expect(Mastermind::GameEngine).not_to be nil
  end

  it 'has class CodeGenerator' do
    expect(Mastermind::CodeGenerator).not_to be nil
  end

  it 'has class player' do
    expect(Mastermind::Player).not_to be nil
  end

  it 'has class message' do
    expect(Mastermind::Message).not_to be nil
  end
end

describe Mastermind::Input do
  before do
    @input = Class.new.extend(Mastermind::Input)
  end

  it 'has module Input' do
    allow(@input).to receive(:user_input).and_return(nil)
    expect(@input.user_input).to be nil
  end
end
