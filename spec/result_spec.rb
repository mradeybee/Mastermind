 require 'spec_helper'
describe Mastermind::Result do
  before :each do
    @result = Mastermind::Result.new("string")
  end

     it 'compares the lines of code' do
      allow(@result).to receive(:rounds).and_return(nil)
      allow(@result).to receive(:seconds).and_return(nil)
      expect(@result.score).to eq([nil, nil])
    end

    it 'returns digit before rounds' do
      allow(@result).to receive(:line).and_return("rounds")
      expect(@result.rounds).to eql(0)
    end
    it 'returns digit before seconds' do
      allow(@result).to receive(:line).and_return("seconds")
      expect(@result.seconds).to eql(0)
    end
 # ?z
end