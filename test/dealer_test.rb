require 'pry'
require "minitest/autorun"
require "dealer"
require "deck"

class DealerTest < Minitest::Unit::TestCase
  def setup
    @shuffled_deck = Deck.new
    @shuffled_deck.shuffle
    @dealer = Dealer.new(@shuffled_deck)
  end

  def test_dealer_has_deck
    assert_equal @dealer.deck, @shuffled_deck
  end

  def test_dealer_can_deal_cards
    first_card = @shuffled_deck.first
    card = @dealer.deal
    assert_equal card, first_card
  end
end
