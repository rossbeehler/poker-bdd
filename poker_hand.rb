class PokerHand
  attr_reader :player
  attr_reader :cards
  attr_reader :type

  def initialize(player, cards)
    @player = player
    @cards = cards
    @type = HandTypeFactory.create(cards)
  end

  def <=>(other_hand)
    @type <=> other_hand.type
  end
end
