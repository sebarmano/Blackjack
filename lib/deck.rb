require 'pry'
require "card"

class Deck
  RANKS = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
  SUITS = [:C, :D, :H, :S]
  
  def initialize
    @deck = []
    create_deck
  end

  def create_deck
    SUITS.each do |suit|
      RANKS.each do |rank|
        @deck << Card.new(rank, suit)
      end
    end
  end

  def cards
    @deck
  end

  def cards=(new_cards)
    @deck = new_cards
  end

  def size
    @deck.size
  end

  def draw
    @deck.shift
  end

  def cards_left
    @deck.size
  end

  def shuffle!
    @deck.shuffle!
  end

  def shuffle
    new_cards = @deck.shuffle
    new_deck = Deck.new
    new_deck.cards = new_cards
    new_deck
  end

  def ==(other)
    #binding.pry
    @deck == other.cards
  end

  def first
    @deck.first
  end
end
