class HumanPlayer

  attr_reader :name, :board 
  def initialize(name="Corey")
    @name = name
    @board = Board.new
  end

end
