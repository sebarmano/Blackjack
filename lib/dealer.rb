require 'deck'
require 'person'

class Dealer < Person
  def initialize(deck)
    @deck = deck
    super()
  end

  def deck
    @deck
  end

  def deal
    @deck.draw
  end
end
