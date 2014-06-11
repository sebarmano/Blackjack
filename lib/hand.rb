class Hand
  include Enumerable
  attr_reader :cards

  def initialize
    @cards = []
  end

  def each
    @cards.each {|card| yield card}
  end

  def add_card(card)
    @cards << card
  end

  def count
    @cards.count
  end

  def sum
    value = map { |card| card.value(card) }
    sum = value.reduce(0, :+)
    if includes_ace? && sum < 12
      sum += 10
    end
    sum
  end

  def busted?
    if sum > 21
      true
    else
      false
    end
  end

  def blackjack?
    count == 2 && sum == 21
  end

  def includes_ace?
    rank = map { |card| card.rank }
    rank.include?(:A)
  end

  def empty
    @cards = []
  end



end
