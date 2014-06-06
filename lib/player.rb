require 'dealer'

class Player
  def initialize(name, money)
    @name = name
    @money = money
    @hand = []
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
    @hand << card
  end

  def bet(bet_money)
    @money -= bet_money
  end
end
