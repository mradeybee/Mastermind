require 'spec_helper'

describe Input do
  include Input
  describe "#user_input" do
    it 'holds user input' do
      expect(user_input).to eql("p")
    end
  end 
end
