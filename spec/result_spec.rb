 require 'spec_helper'

describe Mastermind::Result do
  subject(:result) {Mastermind::Result.new(arg)}
  let(:arg) {"string"}

    it 'sort lines' do
      allow(result).to receive(:score).and_return(nil)
      expect(result.<=>(result)).to eql(0)
    end

     it 'compares the lines of code' do
      allow(result).to receive(:rounds).and_return("rounds")
      allow(result).to receive(:seconds).and_return("seconds")
      expect(result.score).to eq(["rounds", "seconds"])
    end

    it 'returns digit before rounds' do
      result.line = "2 rounds"
      expect(result.rounds).to eql(2)
    end
    it 'returns digit before seconds' do
      result.line = "2 seconds"
      expect(result.seconds).to eql(2)
    end
 # ?z
end