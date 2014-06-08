class Pool
  def initialize
    @money = 0
  end

  def money
    @money
  end

  def add_bet(bet_money)
    @money += bet_money
  end

  def reset 
    @money = 0
  end
end
