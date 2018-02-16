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

  def get_dice
    puts "Please select the die you wish to keep, seperated by commas"
    dice = gets.chomp.split(", ")
  end

  def select_move
    puts "Please select the move you wish to make"
    gets.chomp
  end


end
