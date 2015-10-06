 require 'spec_helper'

 describe Mastermind::Code_generator do
  before do
    @computer = Mastermind::Code_generator.new
  end


  it 'computer generates four elements for beginer level' do
    expect(@computer.computer_choice(0).length).to be (4)
  end

   it 'computer generates five elements for intermidiate level' do
    expect(@computer.computer_choice(1).length).to be (5)
  end

   it 'computer generates six elements for advance level' do
    expect(@computer.computer_choice(2).length).to be (6)
  end
end