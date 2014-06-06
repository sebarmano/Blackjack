require 'deck'

class Dealer
  def initialize(deck)
    @deck = deck
  end

  def deck
    @deck
  end

  def deal
    @deck.draw
  end
end
