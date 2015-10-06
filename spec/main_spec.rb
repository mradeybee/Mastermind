require 'spec_helper'

 describe Mastermind::Starter do
  before do
    @start = Mastermind::Starter.new
  end

  it 'display welcome message' do
    allow(@start).to receive(:welcome).and_return("Welcome to Mastermind")
  end

  it 'prints logo' do
    allow(@start).to receive(:welcome).and_return("Welcome to Mastermind")
  end
end