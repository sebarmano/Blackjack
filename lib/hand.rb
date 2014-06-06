require 'pry'

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

  def aces_count
    aces = 0
    @cards.each do |card|
      aces += 1 if card.rank.to_s == 'A'
    end
    # binding.pry
    aces
  end

  def sum # refactor this
    sum = 0
    @cards.each do |card|
      sum += card.value(card)
    end
    sum -= 10 * aces_count if @ace == 'L'
    sum
  end

  def busted?
    if sum > 21
      if includes_ace? && @ace == 'H'
        @ace = 'L'
        busted?
      end
      true
    else
      false
    end
  end

  def includes_ace?
    @cards.map  { |card| card.rank.to_s }.include?('A')
  end
end
