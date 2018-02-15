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
      Full_house: nil,
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
    five_die_error_check(dice)
    @score_card[:Aces] = number_sum(dice, 1)
  end

  def twos(dice)
    five_die_error_check(dice)
    @score_card[:Twos] = number_sum(dice, 2)
  end

  def threes(dice)
    five_die_error_check(dice)
    @score_card[:Threes] = number_sum(dice, 3)
  end

  def fours(dice)
    five_die_error_check(dice)
    @score_card[:Fours] = number_sum(dice, 4)
  end

  def fives(dice)
    five_die_error_check(dice)
    @score_card[:Fives] = number_sum(dice, 5)
  end

  def sixes(dice)
    five_die_error_check(dice)
    @score_card[:Sixes] = number_sum(dice, 6)
  end

  def three_of_a_kind(dice)
    five_die_error_check(dice)
    @score_card[:Three_of_a_kind] = dice.count(dice.sort[2]) >= 3 ?
      dice.reduce(:+) : 0
  end

  def four_of_a_kind(dice)
    five_die_error_check(dice)
    @score_card[:Four_of_a_kind] = dice.count(dice.sort[2]) >= 4 ?
      dice.reduce(:+) : 0
  end

  def small_straight(dice)
    five_die_error_check(dice)
    sorted_dice = dice.sort.uniq
    small_straight = false
    possibles = [[1, 2, 3, 4,], [2, 3, 4, 5], [3, 4, 5, 6]]
    possibles.each do |possiblity|
      if possiblity.all? { |num| sorted_dice.count(num) == 1 }
        small_straight = true
        break
      end
    end
    small_straight ? @score_card[:Small_straight] = 30 : @score_card[:Small_straight] = 0
  end

  def large_straight(dice)
    five_die_error_check(dice)
    sorted_dice = dice.sort.uniq
    sorted_dice == [1, 2, 3, 4, 5] || sorted_dice == [2, 3, 4, 5, 6] ?
    @score_card[:Large_straight] = 40 : @score_card[:Large_straight] = 0
  end

  private

  def number_sum(dice, number)
    sum = 0
    dice.each { |num| sum += num if num == number }
    sum
  end

  def five_die_error_check(dice)
    raise "Must be Five Dice!" unless dice.length == 5
  end

end
