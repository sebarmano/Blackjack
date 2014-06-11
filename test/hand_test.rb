require "minitest/autorun"
require 'card'
require 'pry'

class HandTest < Minitest::Unit::TestCase
  def setup
    @hand = Hand.new
  end

  def test_hand_has_cards
    card = Card.new(:A, :S)
    @hand.add_card(card)
    assert_equal @hand.cards.last, card
  end

  def test_hand_can_sum_card_values
    card_a = Card.new(3, :S)
    card_b = Card.new(5, :D)
    card_c = Card.new(3, :D)
    card_d = Card.new(:A, :H)

    @hand.add_card(card_a)
    @hand.add_card(card_b)
    sum = @hand.sum
    assert_equal 8, sum

    @hand.add_card(card_c)
    sum = @hand.sum
    assert_equal 11, sum

    @hand.add_card(card_d)
    sum = @hand.sum
    assert_equal 12, sum
  end

  def test_busted_if_higher_than_21
    card_a = Card.new(10, :C)
    card_b = Card.new(:A, :D)
    card_c = Card.new(:J, :H)
    card_d = Card.new(5, :S)

    @hand.add_card(card_a)
    @hand.add_card(card_b)
    refute @hand.busted?

    @hand.add_card(card_c)
    @hand.add_card(card_d)
    assert @hand.busted?
  end

  def test_hand_checks_if_includes_ace # TODO: Complete this test.
    @hand.empty
    # complete here
  end


end
