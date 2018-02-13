require 'rspec'
require 'die'

describe Die do
  describe '#initialize' do
    subject(:die) { Die.new }
    subject(:die2) { Die.new(3) }
    it 'gives a die a nil value unless given one' do
      expect(die.value).to eq(nil)
    end

    it 'gave a die the correct value when given one' do
      expect(die2.value).to eq(3)
    end

    it 'raises an error with an invaled value' do
      expect { Die.new(0) }.to raise_error('Out of Bounds!')
      expect { Die.new(7) }.to raise_error('Out of Bounds!')
    end
  end

  describe '#<=>' do
    it 'raises an error when compared to a non die object' do
        expect { Die.new(3) <=> 4 }.to raise_error('Not a valid Comparison')
        expect { Die.new(3) <=> ["test", 4] }.to raise_error('Not a valid Comparison')
        expect { Die.new(3) <=> "test" }.to raise_error('Not a valid Comparison')
    end

    it 'should return 0 when die are the same' do
      expect(Die.new(3) <=> Die.new(3)).to eq(0)
    end

    it 'should return 1 when die has higher value' do
      expect(Die.new(6) <=> Die.new(4)).to eq(1)
    end

    it 'should return -1 when die has lower value' do
      expect(Die.new(1) <=> Die.new(4)).to eq(-1)
    end
  end

  describe '#roll' do
    subject(:die) { Die.new }
    it 'should roll the die randomly' do
      die.roll
      expect(die.value).to be_between(1, 6)
    end
  end


end
