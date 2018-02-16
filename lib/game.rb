require "die"
require "board"

class Game

  def initialize(players)
    @dice = { 1 => Die.new,
              2 => Die.new,
              3 => Die.new,
              4 => Die.new,
              5 => Die.new }
    @players = players
  end


end
