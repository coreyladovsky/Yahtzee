require 'rspec'
require 'die'

describe Die do
  describe '#initialize' do
    subject(:die) { Die.new }
    it 'gives a die a nil value unless given one' do
      expect(die.value).to eq(nil)
    end

    subject(:die) { Die.new(3) }
    it 'gave a die the correct value when given one' do
      expect(die.value).to eq(3)
    end
  end
end
