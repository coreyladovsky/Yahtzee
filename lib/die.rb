require 'byebug'
class Die
  attr_reader :value

  def initialize(value = nil)
    raise 'Out of Bounds!' unless value.nil? || value.between?(1, 6)
    @value = value
  end

  def <=>(die)
    raise "Not a valid Comparison" unless die.is_a? Die
    if die.value == self.value
      0
    elsif die.value < self.value
      1
    else
      -1
    end
  end

  def roll
    self.value = rand(1..6)
  end

  private
  attr_writer :value

end
