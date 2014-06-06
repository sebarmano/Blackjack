class Hand
  def initialize
    @cards = []
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

  def sum
    sum = 0
    @cards.each do
      sum = + card.value
    end
  end

end
