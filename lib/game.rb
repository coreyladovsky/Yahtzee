require_relative "die"
require_relative "board"
require_relative 'human_player'

class Game

  def initialize(players)
    @dice = { 1 => Die.new,
              2 => Die.new,
              3 => Die.new,
              4 => Die.new,
              5 => Die.new }
    @players = players
    @current_player = @players[0]
  end

  def switch_players!
    @players.rotate!
    @current_player = @players[0]
  end

  def play
    @current_player.board.display

  end


end


if $PROGRAM_NAME == __FILE__
  Game.new([HumanPlayer.new("Corey")]).play
end
