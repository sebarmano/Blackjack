require 'player'
require 'dealer'
require 'pool'

class Game
  def initialize
    @player = Player.new(100)
    @pool = Pool.new
  end

  # def message(message)
  #   case message
  #   when :start
  #     'Welcome to Blackjack'
  #   when :play
  #     'Do you want to (h)it or (s)tand?'
  #   when :bet
  #     'How much do you want to bet?'
  #   when :money
  #     "You have #{@player.money} money"
  #   when :dealer_hand
  #     "Dealer shows #{@dealer.hand[0]}, ??"
  #   when :player_hand
  #     "You have #{ player.hand.each do
  #                   |card| card.rank + card.suit
  #                 end }"
  #   end
  # end


    def pool
    @pool
  end

end
