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

end
