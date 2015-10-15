require 'spec_helper'

describe Mastermind::Difficulty do 
  let(:msg) { Mastermind::Message.new }
  let(:difficulty ) { Class.new.extend(Mastermind::Difficulty)}
  before :each do
    allow(difficulty).to receive(:puts).and_return(nil)
    allow(difficulty).to receive(:game).and_return(nil)
  end

  describe "#difficulty" do
    it 'starts biginer level' do
      allow(difficulty).to receive(:user_input).and_return("b")
      allow(difficulty).to receive(:game).and_return(nil)
      expect(difficulty.difficulty(msg)).to eq(0)
    end
  
    it 'starts intermidiate level' do
      allow(difficulty).to receive(:user_input).and_return("m")
      expect(difficulty.difficulty(msg)).to eq(2)
    end

    it 'starts Advance level' do
      allow(difficulty).to receive(:user_input).and_return("a")
      expect(difficulty.difficulty(msg)).to eq(4)
    end

    it 'rejects invalid entry' do
      allow(difficulty).to receive(:user_input).and_return("k")
      allow(difficulty).to receive(:non_valid).and_return(nil)
      expect(difficulty.difficulty(msg)).to eql(nil)
    end
 
  it 'rejects invalid entry' do
    allow(difficulty).to receive(:user_input).and_return("k")
    allow(difficulty).to receive(:difficulty).and_return(nil)
    expect(difficulty.non_valid(@msg)).to eql(nil)
  end
end
end