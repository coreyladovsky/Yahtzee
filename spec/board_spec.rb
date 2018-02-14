require 'rspec'
require 'board'

describe Board do
  let(:board) { Board.new }

  describe "#score_card" do
    it "should expose the board's @score_card instance vairiable" do
      card = board.instance_variable_get(:@score_card)

      expect(board.score_card).to be(card)
    end
  end

  describe "initialize" do
    context "when passed a score_card agrument" do
      it "sets the boards score_card to the value passed in" do
        score_card = {
                        Aces: 3,
                        Twos: 4
                      }
        board = Board.new(score_card)
        expect(board.score_card).to be(score_card)
      end
    end

    context "when no score_card is passed in" do
      it "creates a score_card with all moves" do
        expect(board.score_card.keys.length).to eq(12)
      end
    end
  end

  describe "#aces(dice)" do
    it "should throw an error if dice is not five in length" do
      dice = [1, 2]
      expect { board.aces(dice) }.to raise_error("Must be Five Dice!")
    end

    it "should accuartely add the dice of value 1" do
      dice = [1, 2, 3, 1, 5]
      expect(board.aces(dice)).to eq(2)
    end

    it "should update score_card" do
      dice = [1, 2, 3, 1, 1]
      board.aces(dice)
      expect(board.score_card[:Aces]).to eq(3)
    end
  end

  describe "#twos(dice)" do
    it "should throw an error if dice is not five in length" do
      dice = [1, 2]
      expect { board.twos(dice) }.to raise_error("Must be Five Dice!")
    end

    it "should accuartely add the dice of value 1" do
      dice = [1, 2, 3, 2, 5]
      expect(board.twos(dice)).to eq(4)
    end

    it "should update score_card" do
      dice = [1, 2, 3, 1, 1]
      board.twos(dice)
      expect(board.score_card[:Twos]).to eq(2)
    end
  end


end
