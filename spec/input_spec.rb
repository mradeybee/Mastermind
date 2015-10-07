require 'spec_helper'

describe Mastermind::Input do
  before :each do
    @input = Mastermind::Input.new
  end 

  describe "#user_input" do
    it 'holds user input' do
      expect(@input.user_input).to eql("p")
    end
  end
end
