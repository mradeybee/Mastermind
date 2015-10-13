require 'spec_helper'

  describe Mastermind::Input do
  include Mastermind::Input
  before do
    @input = Class.new.extend(Mastermind::Input)
  end
  describe "#user_input" do
    it 'holds user input' do
      allow(@input).to receive(:gets).and_return("p")
      expect(@input.user_input).to eql("p")
    end
  end 
end
