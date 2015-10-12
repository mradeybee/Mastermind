# require 'spec_helper'


# describe Difficulty do  

# include Difficulty
#   describe "#difficulty" do
#     before :each do
#       @difficulty = Difficulty.difficulty
#     end

#     it 'slects beginer difficulty level' do
#        # allow(@difficulty).to receive(:user_input).and_return("b")
#        allow(@difficulty).to receive(:begin_game).and_return("Started")
#        expect(@difficulty).to eq("Started")
#       end

#     it 'slects intermidiate difficulty level' do
#        allow(@difficulty).to receive(:difficulty).and_return(1)
#       end

#     it 'shows beginer difficulty level message' do
#        allow(@difficulty).to receive(:difficulty).and_return("I have generated a beginner sequence with four elements made up of: #{@red}, #{@green}, #{@blue} and #{@yellow} Use (q)uit at any time to end the game.")        
#       end

#       it 'shows intermidiate difficulty level message' do
#        allow(@difficulty).to receive(:difficulty).and_return("I have generated an intermidiate sequence with five elements made up of: #{@red}, #{@green}, #{@blue}, #{@yellow} and #{@cyan}. Use (q)uit at any time to end the game.")        
#       end

#     it 'shows advance difficulty level message' do
#       allow(@difficulty).to receive(:difficulty).and_return("I have generated a beginner sequence with four elements made up of: #{@red}, #{@green}, #{@blue} and #{@yellow} Use (q)uit at any time to end the game.")        
#      end
#   end
# # end