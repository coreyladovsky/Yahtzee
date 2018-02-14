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

end
