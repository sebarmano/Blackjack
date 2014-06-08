require 'pool'

class PoolTest < Minitest::Unit::TestCase

  def test_pool_has_money
    pool = Pool.new
    assert_equal pool.money, 0
  end

  def test_pool_can_add_bet
    pool = Pool.new
    pool.add_bet(50)
    assert_equal pool.money, 50
  end

  def test_pool_resets
    pool = Pool.new
    pool.add_bet(50)
    pool.reset
    assert_equal pool.money, 0
  end

end
