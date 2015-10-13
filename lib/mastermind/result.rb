module Mastermind
  class Result
    def initialize(line)
      @line = line
    end

    def <=>(other)
      score <=> other.score
    end

    def score
      [rounds, seconds]
    end

    def rounds
      @line[/\d+ rounds/].to_i
    end

    def seconds
      @line[/\d+ seconds/].to_i
    end
  end
end