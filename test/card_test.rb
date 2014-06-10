require "minitest/autorun"
require "card"

class CardTest < MiniTest::Unit::TestCase
  def test_that_card_has_a_suit
    card = Card.new(:A, :spades)
    assert_equal card.suit, :spades
  end

  def test_that_card_has_a_rank
    card = Card.new(:A, :spades)
    assert_equal card.rank, :A
  end

  def test_that_ace_is_low
    ace = Card.new(:A, :spades)
    two = Card.new(2, :hearts)

    assert two > ace
    refute ace > two
  end

  def test_face_card_ranks
    ten = Card.new(10, :hearts)
    jack = Card.new(:J, :spades)
    queen = Card.new(:Q, :diamonds)
    king = Card.new(:K, :clubs)

    assert king == queen
    assert queen == jack
    assert jack == ten
  end

  def test_cards_are_equal
    ace = Card.new(:A, :spades)
    two_a = Card.new(2, :diamonds)
    two_b = Card.new(2, :hearts)

    assert_equal ace, Card.new(:A, :spades)
    refute_equal ace, two_a
    refute_equal two_a, two_b
  end

end
