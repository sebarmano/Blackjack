require 'player'
require 'dealer'
require 'pool'
require 'deck'

class Game
  def initialize
    deck = Deck.new
    @dealer = Dealer.new(deck)
    @player = Player.new(100)
    @pool = Pool.new
  end

  def play
    puts message(:welcome)
    bet
    round
  end

  def bet
    puts message(:bet)
    bet = gets.to_i
    if can_bet?(bet) # TODO
      @player.bet(bet)
      @pool.add_bet(bet)
    else
      puts message(:bet_not_possible)
      bet
    end
  end

  def round_start
    2.times do
      @player.hit(@dealer.deal)
      @dealer.draw
    end
    puts message(:player_hand)
    show_player_hand # TODO
    puts message(:dealer_first_hand)
    show_dealer_first_hand # TODO
    player_turn
  end

  def player_turn
    if player_hits?
      @player.hit(@dealer.deal)
      show_player_hand # TODO
      player_turn unless player.hand.busted?
    end
    puts message(:player_stands)
    dealer_turn
  end

  def dealer_turn
    show_dealer_hand #  TODO
    unless @dealer.hand.sum >= 17
      @dealer.draw
      unless @dealer.hand.busted?
        dealer_turn
      end
    end
    round_end
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
