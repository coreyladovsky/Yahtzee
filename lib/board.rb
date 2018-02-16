require 'byebug'
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
      Full_house: nil,
      Small_straight: nil,
      Large_straight: nil,
      Yahtzee: nil,
      Chance: nil
    }
  end

  def initialize(score_card = new_score_card)
    @score_card = score_card
    @yahtzee = false
    @upper_score = nil
    @bonus = nil
  end

  def aces(dice)
    already_used_error(:Aces)
    five_die_error_check(dice)
    @score_card[:Aces] = number_sum(dice, 1)
  end

  def twos(dice)
    already_used_error(:Twos)
    five_die_error_check(dice)
    @score_card[:Twos] = number_sum(dice, 2)
  end

  def threes(dice)
    already_used_error(:Threes)
    five_die_error_check(dice)
    @score_card[:Threes] = number_sum(dice, 3)
  end

  def fours(dice)
    already_used_error(:Fours)
    five_die_error_check(dice)
    @score_card[:Fours] = number_sum(dice, 4)
  end

  def fives(dice)
    already_used_error(:Fives)
    five_die_error_check(dice)
    @score_card[:Fives] = number_sum(dice, 5)
  end

  def sixes(dice)
    already_used_error(:Sixes)
    five_die_error_check(dice)
    @score_card[:Sixes] = number_sum(dice, 6)
  end

  def three_of_a_kind(dice)
    five_die_error_check(dice)
    already_used_error(:Three_of_a_kind)
    @score_card[:Three_of_a_kind] = dice.count(dice.sort[2]) >= 3 ?
      dice.reduce(:+) : 0
  end

  def four_of_a_kind(dice)
    five_die_error_check(dice)
    already_used_error(:Four_of_a_kind)
    @score_card[:Four_of_a_kind] = dice.count(dice.sort[2]) >= 4 ?
      dice.reduce(:+) : 0
  end

  def full_house(dice)
    five_die_error_check(dice)
    already_used_error(:Full_house)
    sorted_dice = dice.sort
    dice_hash = Hash.new(0)
    sorted_dice.each { |num| dice_hash[num] += 1 }
    if dice_hash.keys.count == 2 && dice_hash.values.sort == [2, 3]
      @score_card[:Full_house] = 25
    else
      @score_card[:Full_house] = 0
    end
  end

  def small_straight(dice)
    five_die_error_check(dice)
    already_used_error(:Small_straight)
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
    already_used_error(:Large_straight)
    sorted_dice = dice.sort.uniq
    sorted_dice == [1, 2, 3, 4, 5] || sorted_dice == [2, 3, 4, 5, 6] ?
    @score_card[:Large_straight] = 40 : @score_card[:Large_straight] = 0
  end

  def chance(dice)
    five_die_error_check(dice)
    already_used_error(:Chance)
    @score_card[:Chance] = dice.reduce(:+)
  end

  def yahtzee(dice)
    five_die_error_check(dice)
    if dice.all? { |die| die == dice[0] }
      if !@yahtzee
        @yahtzee = true
        @score_card[:Yahtzee] = 50
      else
        if @score_card[:Yahtzee] == 0
          @score_card[:Yahtzee]
        else
          @score_card[:Yahtzee] += 100
        end
      end
    else
      @yahtzee = true
      @score_card[:Yahtzee] = 0
    end
  end

  def upper_section_complete?
    [@score_card[:Aces], @score_card[:Twos], @score_card[:Threes], @score_card[:Fours],
    @score_card[:Fives], @score_card[:Sixes]].all? { |x| !!x }
  end

  def upper_section
    @upper_score =
    @score_card[:Aces] + @score_card[:Twos] + @score_card[:Threes] + @score_card[:Fours] +
    @score_card[:Fives] + @score_card[:Sixes]

    @bonus = @upper_score > 63 ? 35 : 0
  end

  def lower_section
    @score_card[:Three_of_a_kind] + @score_card[:Four_of_a_kind] + @score_card[:Full_house] + @score_card[:Small_straight] +
    @score_card[:Large_straight] + @score_card[:Yahtzee] + @score_card[:Chance]
  end

  private

  def already_used_error(sym)
    raise "Already Been Selected!" unless @score_card[sym].nil?
  end

  def number_sum(dice, number)
    sum = 0
    dice.each { |num| sum += num if num == number }
    sum
  end

  def five_die_error_check(dice)
    raise "Must be Five Dice!" unless dice.length == 5
  end

  def display
    puts "| Upper Section     | How To Score | Points "
    puts "| Aces 1            | Add All 1s   |   #{@score_card[:Aces] ? @score_card[:Aces] : "  "}     "
    puts "| Twos 2            | Add All 2s   |   #{@score_card[:Twos] ? @score_card[:Twos] : "  "}     "
    puts "| Threes 3          | Add All 3s   |   #{@score_card[:Threes] ? @score_card[:Threes] : "  "}     "
    puts "| Fours 4           | Add All 4s   |   #{@score_card[:Fours] ? @score_card[:Fours] : "  "}     "
    puts "| Fives 5           | Add All 5s   |   #{@score_card[:Fives] ? @score_card[:Fives] : "  "}     "
    puts "| Sixes 6           | Add All 6s   |   #{@score_card[:Sixes] ? @score_card[:Sixes] : "  "}     "
    puts "| Total Score       |    ---->     |   #{upper_section_complete? ? @upper_score : "  "}     "
    puts "| Bonus total > 63  |   Score 35   |              "
  end





















//
end



#
