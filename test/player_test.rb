require "minitest/autorun"
require 'player'
require 'game'
require 'deck'

class PlayerTest < Minitest::Unit::TestCase
  def setup
    @player = Player.new('Sebastian', 1000)
  end

  def test_player_has_a_name
    assert_equal @player.name, "Sebastian"
  end

  def test_player_has_money
    assert_equal @player.money, 1000
  end

  def test_player_has_a_hand
    deck = Deck.new
    cards = deck.cards[0, 2]
    2.times { @player.hit(deck.draw) } # ask about this
    assert_equal @player.hand.cards, cards
  end

  def test_player_can_hit
    dealer = Dealer.new(Deck.new)
    card = dealer.deal
    before_cards = @player.hand.count
    @player.hit(card)
    after_cards = @player.hand.count
    assert_equal before_cards + 1, after_cards
  end

  def test_player_can_bet
    money_before_bet = @player.money
    game = Game.new
    pool_before = game.pool
    bet_money = 50
    @player.bet(bet_money)
    game.add_bet(bet_money)
    assert_equal @player.money, money_before_bet - bet_money
    assert_equal game.pool, pool_before + bet_money
  end

end
