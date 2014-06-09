class Card
  SYMBOL_VALUES = { :A => 1, :K =>13, :Q => 12, :J => 11 }
  include Comparable
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value(card)
    if card.rank.is_a?(Symbol)
      SYMBOL_VALUES[card.rank]
    else
      card.rank
    end
  end

  def <=>(other)
    value(self) <=> other.value(other)
  end

  def ==(card)
    rank == card.rank && suit == card.suit
  end
end
