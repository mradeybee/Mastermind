#!/usr/bin/env ruby

require "bundler/setup" 
require "mastermind"

# You can add fixtures and/or initialization code here to make experimenting
# with your gem easier. You can also use a different console, if you like.

# (If you use this, don't forget to add pry to your Gemfile!)
# require "pry"
# Pry.start

#require "irb"
#IRB.start

module Mastermind
    game = Game_Engine.new
    game.welcome
    game.ask
end