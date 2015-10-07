require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mastermind'
require "messages"
require "main"
require "player"
require "computer"
require "game_engine"

class Mastermind::Input
    def user_input
      input = "p"
    end
  end

  class Mastermind::Starter
    def difficulty
      nil
    end
  end

  module Kernel
    def puts(x)
      nil
    end
  end

  class Mastermind::Game_Engine
    def try_again(exact, partial)
      @final_time = nil
    end
  end