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

  def test_dealer_has_hand # this test hand and draw. Is this right?
    cards = @shuffled_deck.cards[0, 2]
    2.times { @dealer.hit(@shuffled_deck.draw) }
    assert_equal @dealer.hand.cards, cards
  end

  def test_dealer_can_draw_cards
    cards_before = @dealer.hand.cards.count
    @dealer.hit(@shuffled_deck.draw)
    assert_equal cards_before + 1, @dealer.hand.cards. count
  end

  def test_dealer_can_deal_cards
    first_card = @shuffled_deck.first
    card = @dealer.deal
    assert_equal card, first_card
  end

  def test_dealer_hand_reset
    @dealer.hit(@shuffled_deck.draw)
    @dealer.hand.empty
    assert_equal [], @dealer.hand.cards
  end
end
