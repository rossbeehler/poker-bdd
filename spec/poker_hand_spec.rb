require_relative '../poker'

describe PokerHand do
  it "belongs to a player" do
    subject = PokerHand.new(:player1, nil)
    subject.player.should == :player1
  end

  it "has cards" do
    subject = PokerHand.new(:player1, %W(2S 3S 4S 5S 6S))
    subject.cards.should == %W(2S 3S 4S 5S 6S)
  end

  it "has a type" do
    HandTypeFactory.stub(:create).with(%W(2S)) { HighCardHandType.new }
    subject = PokerHand.new(:player1, %W(2S))
    subject.type.class.should == HighCardHandType
  end

  context "compares itself to other hands" do
    it "compares matching hand types" do
      hand_type1 = HighCardHandType.new
      HandTypeFactory.stub(:create).with(%W(2S)) { hand_type1 }
      hand1 = PokerHand.new(:player1, %W(2S))

      hand_type2 = HighCardHandType.new
      HandTypeFactory.stub(:create).with(%W(2H)) { hand_type2 }
      hand2 = PokerHand.new(:player2, %W(2H))
      
      hand_type1.stub(:<=>).with(hand_type2) { -1 }

      (hand1 <=> hand2).should == -1
    end
  end
end

