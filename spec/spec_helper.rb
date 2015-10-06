require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mastermind'
require "messages"
require "main"
require "player"
require "computer"
require "game_engine"