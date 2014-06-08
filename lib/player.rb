require 'dealer'
require 'hand'

class Player
  def initialize(money)
    @money = money
    @hand = Hand.new
  end

  def money
    @money
  end

  def hand
    @hand
  end

  def hit(card)
    @hand.add_card(card)
  end

  def bet(bet_money)
    @money -= bet_money
  end

  def win(money_won) # need test for this
    @money += money_won
  end

  def lose(money_lost) # need test for this
    @money -= money_lost
  end
end
