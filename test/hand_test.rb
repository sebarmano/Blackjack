require "minitest/autorun"
require 'card'

class HandTest < Minitest::Unit::TestCase
  def setup
    @hand = Hand.new
  end

  def test_hand_has_cards
    card = Card.new(:A, :S)
    @hand.add_card(card)
    assert_equal @hand.cards.last, card
  end

  def hand_can_sum_card_values
    card_a = Card.new(3, :S)
    card_b = Card.new(5, :D)
    @hand.add_card(card_a)
    @hand.add_card(card_b)
    assert_equal hand.sum, 8
  end

end
