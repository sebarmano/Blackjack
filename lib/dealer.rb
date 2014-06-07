require 'deck'

class Dealer
  def initialize(deck)
    @deck = deck
    @hand = Hand.new
  end

  def deck
    @deck
  end

  def deal
    @deck.draw
  end

  def draw
    @hand.add_card(@deck.draw)
  end

  def hand
    @hand
  end
end
