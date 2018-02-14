class Board
  attr_reader :score_card
  def new_score_card
    {
      Aces: nil,
      Twos: nil,
      Threes: nil,
      Fours: nil,
      Fives: nil,
      Sixes: nil,
      Three_of_a_kind: nil,
      Four_of_a_kind: nil,
      Small_straight: nil,
      Large_straight: nil,
      Yahtzee: nil,
      Chance: nil
    }
  end

  def initialize(score_card = new_score_card)
    @score_card = score_card
  end

  def aces(dice)
    raise "Must be Five Dice!" unless dice.length == 5
    sum = 0
    dice.each { |num| sum += num if num == 1 }
    @score_card[:Aces] = sum
    sum 
  end

end
