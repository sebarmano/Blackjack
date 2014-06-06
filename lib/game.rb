class Game
  def initialize
    @pool = 0
  end

  def pool
    @pool
  end

  def add_bet(bet_money)
    @pool += bet_money
  end
end
