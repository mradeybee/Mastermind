require 'spec_helper'

  describe Mastermind::Input do
  include Mastermind::Input
  describe "#user_input" do
    it 'holds user input' do
      allow(Mastermind::Input).to receive(:user_input).and_return("Input")
      expect(Mastermind::Input.user_input).to eql("Input")
    end
  end 
end
