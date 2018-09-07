require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib/mastermind', __FILE__)
require 'mastermind'
require 'messages'
require 'player'
require 'computer'
require 'game_engine'
require 'difficulty'
require 'result'
