class Hand
  def initialize
    @cards = []
    @ace = 'H'
  end

  def cards
    @cards
  end

  def add_card(card)
    @cards << card
  end

  def count
    @cards.count
  end

  def sum # refactor this
    sum = 0
    @cards.each do |card|
      sum += card.value(card)
    end
    if includes_ace? && sum < 11
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

  def includes_ace?
    @cards.map  { |card| card.rank.to_s }.include?('A')
  end

  def empty
    @cards = []
  end
end
