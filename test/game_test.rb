require "minitest/autorun"
require "game"

class GameTest < Minitest::Unit::TestCase
  def setup
    @game = Game.new
  end

  def test_game_has_pool_of_money
    assert_equal @game.pool.money, 0
  end
end
