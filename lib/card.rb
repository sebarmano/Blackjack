class Card
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @values = {:A => 11, :K =>13, :Q => 12, :J => 11}
  end

  def rank
    @rank
  end

  def suit
    @suit
  end

  def value(card)
    if card.rank.is_a?(Symbol)
       @values[card.rank]
    else
      card.rank
    end
  end

  def greater_than?(card)
    value(self) > card.value(card)
  end

  def ==(card)
    rank == card.rank && suit == card.suit
  end



end
