require "minitest/autorun"
require "game"

class PlayerTest < Minitest::Unit::TestCase
  def setup
    game = Game.new
  end

  def test_game_has_pool_of_money
    assert_equal game.pool, 0
  end
end
