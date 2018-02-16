class HumanPlayer

  attr_reader :name, :board
  def initialize(name="Corey")
    @name = name
    @board = Board.new
    @turns = 13
  end

  def finish_turn
    @turns -= 1
  end

  def game_over?
    @turns == 0
  end



end
