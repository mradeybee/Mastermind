require 'spec_helper'

  describe Mastermind::Input do
  include Mastermind::Input
  before do
    @input = Class.new.extend(Mastermind::Input)
  end
  describe "#user_input" do
    it 'holds user input' do
      allow(@input).to receive(:user_input).and_return(nil)
      expect(@input.user_input).to be nil
    end
  end 
end
