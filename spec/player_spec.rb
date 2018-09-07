require 'spec_helper'

describe Mastermind::Player do
  let(:player) { Mastermind::Player.new }

  before :each do
    allow(player).to receive(:puts).and_return(nil)
  end

  describe '#is_valid?' do
    it 'takes user input' do
      allow(player).to receive(:player_entry).and_return(%w[r r r r])
      expect(player.player_entry).to eq(%w[r r r r])
    end

    it 'validates user input' do
      expect(player.is_valid?(%w[r g b y])).to be true
    end

    it 'rejects invalid input' do
      expect(player.is_valid?(['r', 't', 'y', 1])).to be nil
    end
  end

  describe '#player_entry' do
    it 'quits if player enters q' do
      allow(player).to receive(:user_input).and_return('q')
      expect { player.player_entry(4, %w[r r r r]) }.to raise_error SystemExit
    end

    it 'shows hint' do
      allow(player).to receive(:user_input).and_return('h')
      allow(player).to receive(:hint).and_return('hint shown')
      expect(player.player_entry(4, %w[r r r r])).to eql('hint shown')
    end

    it 'shows hint limit' do
      allow(player).to receive(:user_input).and_return('h')
      allow(player).to receive(:h_num).and_return(2)
      allow(player).to receive(:invalid).and_return('not valid')
      expect(player.player_entry(4, %w[r r r r])).to eql('not valid')
    end

    it 'turns user input into an array' do
      allow(player).to receive(:user_input).and_return('rrrr')
      expect(player.player_entry(4, %w[rrrr])).to eql(%w[r r r r])
    end
  end

  it 'detects short inputs' do
    allow(player).to receive(:user_input).and_return('rrr')
    allow(player).to receive(:invalid).and_return('not valid')
    expect(player.player_entry(4, %w[r r r r])).to eql('not valid')
  end

  it 'detects long inputs' do
    allow(player).to receive(:user_input).and_return('rrrrr')
    allow(player).to receive(:invalid).and_return('not valid')
    expect(player.player_entry(4, %w[r r r r])).to eql('not valid')
  end

  it 'detects invalid inputs' do
    allow(player).to receive(:user_input).and_return('rrwr')
    allow(player).to receive(:invalid).and_return(nil)
    expect(player.player_entry(4, %w[r r r r])).to be nil
  end

  it 'detects invalid inputs and returns to ask for input' do
    allow(player).to receive(:user_input).and_return('rrwr')
    allow(player).to receive(:player_entry).and_return('Play again')
    expect(player.invalid(4, %w[r r r r])).to eql('Play again')
  end

  describe '#hint' do
    it 'gets hint' do
      allow(player).to receive(:player_entry).and_return('hint')
      expect(player.hint(4, %w[r r r r])).to eql('hint')
    end
  end
end
