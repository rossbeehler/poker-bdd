require_relative '../../poker'

Given /^(\w+) has a high card hand with (\d+) as the high card$/ do |player, high_card|
  @poker_round ||= PokerRound.new
  @poker_round.add_hand(player.to_sym, %W(2S 3S 4S 5S #{high_card}C))
end

Then /^(\w+) is the winner$/ do |player|
  @poker_round.winner.should == player.to_sym
end
