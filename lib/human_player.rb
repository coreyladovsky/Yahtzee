class HumanPlayer

  attr_reader :name, :board
  def initialize(name = "Corey")
    @name = name
    @board = Board.new
    @turns = 13
    @yahtzee = false
  end

  def finish_turn
    @turns -= 1
  end

  def game_over?
    @turns == 0
  end

  def get_dice
    puts "Please select the die you wish to keep, seperated by commas"
    gets.chomp.split(", ")
  end

  def select_move(dice)
    dice = dice.map(&:value)
    puts "Please select the move you wish to make"
    input = gets.chomp
    case input
    when "a"
      self.board.aces(dice)
    when "b"
      self.board.twos(dice)
    when "c"
      self.board.threes(dice)
    when  "d"
       self.board.fours(dice)
    when  "e"
       self.board.fives(dice)
    when  "f"
       self.board.sixes(dice)
    when  "g"
       self.board.three_of_a_kind(dice)
    when  "h"
       self.board.four_of_a_kind(dice)
    when  "i"
       self.board.full_house(dice)
    when  "j"
       self.board.small_straight(dice)
    when  "k"
       self.board.large_straight(dice)
    when  "l"
      if @yahtzee
        raise "Yahtzee already chosen, bonus yahtzee's will be added to your final score"
      else
       self.board.yahtzee(dice)
       @yahtzee = true
     end
    when  "m"
       self.board.chance(dice)
    else
        raise "Invalid Move"
    end
  end


end
