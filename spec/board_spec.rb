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
        expect(board.score_card.keys.length).to eq(13)
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

    it "should throw an eror if method has already been select" do
      board.aces([1, 2, 1, 2, 1])
      expect { board.aces([4, 3, 1, 2, 2]) }.to raise_error("Already Been Selected!")
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

    it "should throw an eror if method has already been select" do
      board.twos([1, 2, 1, 2, 1])
      expect { board.twos([4, 3, 1, 2, 2]) }.to raise_error("Already Been Selected!")
    end
  end

  describe "#threes(dice)" do
    it "should throw an error if dice is not five in length" do
      dice = [1, 2]
      expect { board.threes(dice) }.to raise_error("Must be Five Dice!")
    end

    it "should accuartely add the dice of value 1" do
      dice = [1, 3, 3, 2, 3]
      expect(board.threes(dice)).to eq(9)
    end

    it "should update score_card" do
      dice = [1, 2, 5, 1, 1]
      board.threes(dice)
      expect(board.score_card[:Threes]).to eq(0)
    end

    it "should throw an eror if method has already been select" do
      board.threes([1, 2, 1, 2, 1])
      expect { board.threes([4, 3, 1, 2, 2]) }.to raise_error("Already Been Selected!")
    end
  end

  describe "#fours(dice)" do
    it "should throw an error if dice is not five in length" do
      dice = [1, 2]
      expect { board.fours(dice) }.to raise_error("Must be Five Dice!")
    end

    it "should accuartely add the dice of value 1" do
      dice = [1, 3, 3, 2, 3]
      expect(board.fours(dice)).to eq(0)
    end

    it "should update score_card" do
      dice = [1, 2, 5, 4, 4]
      board.fours(dice)
      expect(board.score_card[:Fours]).to eq(8)
    end

    it "should throw an eror if method has already been select" do
      board.fours([1, 2, 1, 2, 1])
      expect { board.fours([4, 3, 1, 2, 2]) }.to raise_error("Already Been Selected!")
    end
  end

  describe "#fives(dice)" do
    it "should throw an error if dice is not five in length" do
      dice = [1, 2]
      expect { board.fives(dice) }.to raise_error("Must be Five Dice!")
    end

    it "should accuartely add the dice of value 1" do
      dice = [5, 3, 5, 2, 3]
      expect(board.fives(dice)).to eq(10)
    end

    it "should update score_card" do
      dice = [1, 2, 5, 1, 1]
      board.fives(dice)
      expect(board.score_card[:Fives]).to eq(5)
    end

    it "should throw an eror if method has already been select" do
      board.fives([1, 2, 1, 2, 1])
      expect { board.fives([4, 3, 1, 2, 2]) }.to raise_error("Already Been Selected!")
    end
  end

  describe "#sixes(dice)" do
    it "should throw an error if dice is not five in length" do
      dice = [1, 2]
      expect { board.sixes(dice) }.to raise_error("Must be Five Dice!")
    end

    it "should accuartely add the dice of value 1" do
      dice = [1, 3, 3, 6, 3]
      expect(board.sixes(dice)).to eq(6)
    end

    it "should update score_card" do
      dice = [1, 6, 5, 6, 1]
      board.sixes(dice)
      expect(board.score_card[:Sixes]).to eq(12)
    end

    it "should throw an eror if method has already been select" do
      board.sixes([1, 2, 1, 2, 1])
      expect { board.sixes([4, 3, 1, 2, 2]) }.to raise_error("Already Been Selected!")
    end
  end

  describe "#three_of_a_kind" do
    it "should throw an error if dice is not five in length" do
      dice = [1, 2, 3, 4, 5, 6]
      expect { board.three_of_a_kind(dice) }.to raise_error("Must be Five Dice!")
    end
    it "should accuartely add all of the dice" do
      dice = [5, 3, 1, 5, 5]
      expect(board.three_of_a_kind(dice)).to eq(19)
    end
    it "should update score_card" do
      dice = [5, 3, 5, 5, 5]
      board.three_of_a_kind(dice)
      expect(board.score_card[:Three_of_a_kind]).to eq(23)
    end
    it "should give a score of zero if there are not three of a kind" do
      dice = [5, 5, 1, 2, 3]
      expect(board.three_of_a_kind(dice)).to eq(0)
    end

    it "should throw an eror if method has already been select" do
      board.three_of_a_kind([1, 2, 1, 2, 1])
      expect { board.three_of_a_kind([4, 3, 1, 2, 2]) }.to raise_error("Already Been Selected!")
    end
  end

  describe "#four_of_a_kind" do
    it "should throw an error if dice is not five in length" do
      dice = [1, 2, 3, 4, 5, 6]
      expect { board.four_of_a_kind(dice) }.to raise_error("Must be Five Dice!")
    end
    it "should accuartely add all of the dice" do
      dice = [6, 3, 6, 6, 6]
      expect(board.four_of_a_kind(dice)).to eq(27)
    end
    it "should update score_card" do
      dice = [4, 4, 4, 4, 4]
      board.four_of_a_kind(dice)
      expect(board.score_card[:Four_of_a_kind]).to eq(20)
    end
    it "should give a score of zero if there are not four of a kind" do
      dice = [5, 5, 1, 2, 3]
      expect(board.four_of_a_kind(dice)).to eq(0)
    end

    it "should throw an eror if method has already been select" do
      board.four_of_a_kind([1, 2, 1, 2, 1])
      expect { board.four_of_a_kind([4, 3, 1, 2, 2]) }.to raise_error("Already Been Selected!")
    end
  end

  describe "#full_house" do
    it "should throw an error if dice is not five in length" do
      expect { board.full_house([1, 2, 3, 4, 5, 6]) }.to raise_error("Must be Five Dice!")
    end
    it "should accuartely determine a full_house" do
      board.full_house([3, 2, 2, 2, 3])
      expect(board.score_card[:Full_house]).to eq(25)
    end

    it "should give a score of zero if there is not a full house" do
      board.full_house([5, 5, 5, 2, 1])
      expect(board.score_card[:Full_house]).to eq(0)
    end

    it "should throw an eror if method has already been select" do
      board.full_house([1, 2, 1, 2, 1])
      expect { board.full_house([4, 3, 1, 2, 2]) }.to raise_error("Already Been Selected!")
    end
  end

  describe "#small_straight" do
    it "should throw an error if dice is not five in length" do
      expect { board.small_straight([1, 2, 3, 4, 5, 6]) }.to raise_error("Must be Five Dice!")
    end
    it "should accuartely determine a small_straight" do
      board.small_straight([3, 6, 4, 6, 5])
      expect(board.score_card[:Small_straight]).to eq(30)
    end

    it "should give a score of zero if there is not a small straight" do
      board.small_straight([5, 5, 1, 2, 3])
      expect(board.score_card[:Small_straight]).to eq(0)
    end

    it "should throw an eror if method has already been select" do
      board.small_straight([1, 2, 1, 2, 1])
      expect { board.small_straight([4, 3, 1, 2, 2]) }.to raise_error("Already Been Selected!")
    end
  end

  describe "#large_straight" do
    it "should throw an error if dice is not five in length" do
      expect { board.large_straight([1, 2, 3, 4, 5, 6]) }.to raise_error("Must be Five Dice!")
    end
    it "should accuartely determine a large_straight" do
      board.large_straight([3, 6, 4, 2, 5])
      expect(board.score_card[:Large_straight]).to eq(40)
    end

    it "should give a score of zero if there is not a large straight" do
      board.large_straight([5, 6, 1, 2, 3])
      expect(board.score_card[:Large_straight]).to eq(0)
    end

    it "should throw an eror if method has already been select" do
      board.large_straight([1, 2, 1, 2, 1])
      expect { board.large_straight([4, 3, 1, 2, 2]) }.to raise_error("Already Been Selected!")
    end
  end

  describe "#chance" do
    it "should throw an error if dice is not five in length" do
      expect { board.chance([1, 2, 3, 4, 5, 6]) }.to raise_error("Must be Five Dice!")
    end

    it "should add up all dice and add it to the score_card" do
      board.chance([4, 5, 3, 2, 1])
      expect(board.score_card[:Chance]).to eq(15)
    end

    it "will not let me change a current value of chance" do
      board.chance([4, 5, 3, 2, 1])
      expect { board.chance([4, 3, 1, 2, 2]) }.to raise_error("Already Been Selected!")
    end
  end


end
