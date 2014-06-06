require 'dealer'
require 'hand'

class Player
  def initialize(name, money)
    @name = name
    @money = money
    @hand = Hand.new
  end

  def name
    @name
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
end
