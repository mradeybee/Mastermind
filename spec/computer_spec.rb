 require 'spec_helper'

describe Mastermind::CodeGenerator do
  before :each do
    @computer = Mastermind::CodeGenerator.new
  end

  it 'computer generates four elements for beginer level' do
    expect(@computer.computer_choice(4).length).to be 4
  end

  it 'computer generates five elements for intermidiate level' do
    expect(@computer.computer_choice(5).length).to be 5
  end

  it 'computer generates six elements for advance level' do
    expect(@computer.computer_choice(6).length).to be 6
  end
end
