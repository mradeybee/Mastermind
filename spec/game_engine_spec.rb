 require 'spec_helper'
# require 'pry'
describe Mastermind::Game_Engine do
   let(:game) { Mastermind::Game_Engine.new }

  before :each do
    allow_message_expectations_on_nil
    allow(game).to receive(:puts).and_return(nil)
  end
  
  describe "#exact_match" do
    it 'returns exact matches'  do
      expect(game.exact_match(["r","r","r","r"], ["r","r","r","r"])).to eql([[0, 0, 0, 0], 4])
    end
  end

  describe "#partial_match" do
    it 'returns partial matches'  do
      expect(game.partial_match(["g", "y", "r", "b"], ["r", "g", "b", "y"])).to eql(4)
    end
  end
 

  describe "#game" do
    it 'plays the game' do
      allow(game.computer_code).to receive(:computer_choice).with(0).and_return(["r","r","r","r"])
      allow(game.player).to receive(:player_entry).and_return(nil)
      allow(game).to receive(:exact_match).and_return([[nil, nil,nil, nil], 4])
      allow(game).to receive(:partial_match).and_return(0)
      allow(game).to receive(:analysis).and_return(nil)
      allow(game).to receive(:winner).and_return("win")
      allow(game).to receive(:difficulty).and_return(0)
      expect(game.game).to eql("win")
    end
  end

   describe "#analysis" do
    it 'analyses the game' do
      game.instance_variable_set("@counter", 13)
      allow(game).to receive(:try_again).and_return("done")
      expect(game.analysis(["r", "g", "b", "y"], 2, 0)).to eql("done")
    end
   end 

   describe "#winner" do
    it 'checks for winners' do
      allow(game).to receive(:start_time).and_return(1)
      allow(game).to receive(:final_time).and_return(2)
      allow(game).to receive(:namer).and_return("name")
      allow(game).to receive(:save_file).and_return("Saved")
      allow(game).to receive(:leaderboard).and_return("lead")
      allow(game).to receive(:ask).and_return("Asked")
      expect(game.winner).to eql("Asked")

    end
   end

   describe "#try_again" do
    it 'tells player to try again' do
      allow(game).to receive(:final_time).and_return(20)
      allow(game).to receive(:counter).and_return(0)
      allow(game).to receive(:ask).and_return("tried")
      expect(game.try_again(2,2)).to eql("tried")
    end
   end

   describe "#namer" do
    it 'asks for user name' do
      allow(game).to receive(:user_input).and_return("p")
      expect(game.namer).to eql("p")
    end
   end

  describe "#save_file" do
    it "should create 'filename' and put 'text' in it" do
    allow(game).to receive(:leaderboard).and_return("Done")
    expect(game.save_file("./bin/testgameresults.txt")).to be nil
    end
  end  

  describe "#leaderboard" do
    it "should read the result file and print out top ten" do
    allow(game).to receive(:ask).and_return("Asked Again")
    expect(game.leaderboard("./bin/testgameresults.txt")).to eql("Asked Again")
    end
  end
end