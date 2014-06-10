require 'person'

class Player < Person
  def initialize(money)
    @money = money
    super()
  end

  def money
    @money
  end

  def bet(bet_money)
    @money -= bet_money
  end

  def win(money_won) # need test for this
    @money += money_won
  end
end
