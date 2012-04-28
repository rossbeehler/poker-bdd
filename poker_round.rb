require_relative 'poker'

class PokerRound
  attr_reader :hands

  def add_hand(player, cards)
    @hands ||= []
    @hands << PokerHand.new(player, cards)
  end

  def winner
    @hands.sort[-1].player
  end
end
