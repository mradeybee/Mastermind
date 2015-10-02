#require "mastermind/version"
require "colorize"
require_relative "main"
require_relative "player"
require_relative "computer"
require_relative "game_engine"

module Mastermind
p Code_generator::Computer
Starter.new.welcome
Starter.new.ask
Game_Engine.new.game
end
