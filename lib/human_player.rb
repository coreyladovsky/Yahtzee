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

  def select_move(dice)
    puts "Please select the move you wish to make"
    input = gets.chomp
    case input
    when "a"
      self.board.aces(dice)
    when "b"
      self.board.twos(dice)
          # "c" => @current_player.board.threes(@dice),
          # "d" => @current_player.board.fours(@dice),
          # "e" => @current_player.board.fives(@dice),
          # "f" => @current_player.board.sixes(@dice),
          # "g" => @current_player.board.three_of_a_kind(@dice),
          # "h" => @current_player.board.four_of_a_kind(@dice),
          # "i" => @current_player.board.full_house(@dice),
          # "j" => @current_player.board.small_straight(@dice),
          # "k" => @current_player.board.large_straight(@dice),
          # "l" => @current_player.board.yahtzee(@dice),
          # "m" => @current_player.board.chance(@dice)
        else
          return
        end
  end


end
