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
end
