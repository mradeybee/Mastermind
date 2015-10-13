 require 'spec_helper'
describe Mastermind::Result do
  before :each do
    @result = Mastermind::Result.new("string")
  end
  describe "#<=>" do
    it 'compares the lines of code' do
      allow(@result).to receive(:<=>).and_return(nil)
      expect(@result.<=>("name")).to be nil
    end

    it 'compares the lines of code' do
      allow(@result).to receive(:rounds).and_return(nil)
      allow(@result).to receive(:seconds).and_return(nil)
      expect(@result.score).to eq([nil, nil])
    end
  end
end