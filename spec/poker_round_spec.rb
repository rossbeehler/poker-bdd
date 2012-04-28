require_relative '../poker'

describe PokerRound do
  it "should accept multiple hands" do
    subject.add_hand(:player1, %W(2S 3S 4S 5S 6S))
    subject.add_hand(:player2, %W(2C 3C 4C 5C 6S))

    subject.hands[0].player.should == :player1
    subject.hands[0].cards.should == %W(2S 3S 4S 5S 6S)
    subject.hands[1].player.should == :player2
    subject.hands[1].cards.should == %W(2C 3C 4C 5C 6S)
  end

  it "should determine a winner" do
    subject.add_hand(:player1, nil)
    subject.add_hand(:player2, nil)
    subject.hands.stub(:sort).and_return([PokerHand.new(:player2, nil), PokerHand.new(:player1, nil)])
    subject.winner.should == :player1
  end
end
