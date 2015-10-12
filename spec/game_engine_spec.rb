 require 'spec_helper'
# require 'pry'
describe Mastermind::Game_Engine do
  
  

  before :each do
    @game = Mastermind::Game_Engine.new(0)
    @start = Mastermind::Starter.new
    @player = Mastermind::Player.new
    allow_message_expectations_on_nil
  end
  
  describe "#exact_match" do
    it 'returns exact matches'  do
      expect(@game.exact_match(["r","r","r","r"], ["r","r","r","r"])).to eql([[0, 0, 0, 0], 4])
    end
  end

  describe "#partial_match" do
    it 'returns partial matches'  do
      expect(@game.partial_match(["g", "y", "r", "b"], ["r", "g", "b", "y"])).to eql(4)
    end
  end
  describe "#replay" do
      it 'asks players to replay' do
      allow(@game).to receive(:user_input).and_return("p")
      allow(@game).to receive(:difficulty).and_return(nil)
      allow(@game).to receive(:replay).and_return(nil)
      expect(@game.replay).to be nil
    end
    it 'quits if user wants to quit' do
      allow(@game).to receive(:user_input).and_return("q")
      expect{@game.replay}.to raise_error SystemExit
    end

    it 'detects invalid entries' do
      allow(@game).to receive(:user_input).and_return("k")
      allow(@game).to receive(:replay).and_return(nil)
      expect(@game.replay).to be nil
    end
  end

  describe "#game" do
    it 'plays the game' do
      allow(@game.computer_code).to receive(:computer_choice).with(0).and_return(["r","r","r","r"])
      allow(@game.player).to receive(:player_entry).and_return(nil)
      allow(@game).to receive(:exact_match).and_return([[nil, nil,nil, nil], 4])
      allow(@game).to receive(:partial_match).and_return(0)
      allow(@game).to receive(:analysis).and_return(nil)
      allow(@game).to receive(:winner).and_return(nil)
      expect(@game.game(0)).to be nil
    end
  end

   describe "#analysis" do
    it 'analyses the game' do
      allow(@game).to receive(:counter).and_return(1)
      allow(@game).to receive(:try_again).and_return(nil)
      expect(@game.analysis(["r", "g", "b", "y"], 4, 0)).to be nil 
    end
   end 

   describe "#winner" do
    it 'checks for winners' do
      allow(@game).to receive(:start_time).and_return(1)
      allow(@game).to receive(:final_time).and_return(2)
      allow(@game).to receive(:namer).and_return(nil)
      allow(@game).to receive(:save_file).and_return(nil)
      allow(@game).to receive(:leaderboard).and_return(nil)
      allow(@game).to receive(:replay).and_return(nil)
      expect(@game.winner(0)).to be nil

    end
   end

   describe "#try_again" do
    it 'tells player to try again' do
      allow(@game).to receive(:replay).and_return(nil)
      allow(@game).to receive(:counter).and_return(1)
      expect(@game.try_again(2,2)).to be nil
    end
   end

   describe "#namer" do
    it 'asks for user name' do
      allow(@game).to receive(:user_input).and_return("p")
      expect(@game.namer).to eql("p")
    end
   end

  describe "save_file" do
    
    let(:file_like_object) { double("file like object") }
    it "should create 'filename' and put 'text' in it" do
    allow(@game).to receive(:leaderboard).and_return(nil)
    allow(File).to receive(:open).with("game_results.txt", "a+").and_return(file_like_object)
    expect(@game.save_file).to be nil
    end
end
end