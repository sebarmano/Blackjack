require 'pry'
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
    @messages = {
      :welcome => "*** BLACKJACK TIME !! ***",
      :bet => "Make your bet: ",
      :bet_not_possible => "Bet not possible, try again.",
      :player_hand => "Your cards >",
      :dealer_first_hand => "Dealer first cards >",
      :player_stands => "Player stands! Your hand sum is #{@player.hand.sum}.\nIt's Dealer turn...",
      :player_hits => "One more card for the Player!",
      :hit_or_stand => "Do you want to (h)it or (s)tand? ",
      :dont_understand => "I don't understand what you're saying.",
      :no_money => "You don't have any money left. Better luck next time",
      :player_money => "You have $#{@player.money}",
      :player_wins => "Player wins! You've won $#{@pool.money}.",
      :dealer_wins => "Dealer wins. Dealer hand sum is #{@dealer.hand.sum}.\nYou've lost $#{@pool.money}.",
      :dealer_end_turn => "Dealer cards >" }
  end

  def play
    bet_made = bet
    bet unless bet_made
    round_start
  end

  def bet
    puts @messages[:player_money]
    print @messages[:bet]
    bet = gets.to_i
    if can_bet?(bet)
      @player.bet(bet)
      @pool.add_bet(bet)
      true
    else
      puts @messages[:bet_not_possible]
      false
    end
  end

  def round_start
    reset_game
    2.times do
      @player.hit(@dealer.deal)
      @dealer.draw
    end
    show_hand(@player)
    print @messages[:dealer_first_hand]
    show_dealer_first_hand
    player_turn
  end

  def player_turn
    if player_hits?
      puts @messages[:player_hits]
      @player.hit(@dealer.deal)
      show_hand(@player)
      player_turn unless @player.hand.busted?
    end
    puts @messages[:player_stands]
    dealer_turn
  end

  def dealer_turn
    unless @dealer.hand.sum >= 17
      @dealer.draw
      unless @dealer.hand.busted?
        dealer_turn
      end
    end
    print @messages[:dealer_end_turn]
    show_hand(@dealer)
    round_end
  end

  def round_end
    if @player.hand.busted?
      dealer_wins
    elsif @dealer.hand.busted?
      player_wins
    elsif @player.hand.sum <= @dealer.hand.sum
      dealer_wins
    else
      player_wins
    end
    @player.money > 0 ? play : end_game
  end

  def can_bet?(bet)
    bet > 0 && bet <= @player.money
  end

  def player_hits?
    print @messages[:hit_or_stand]
    answer = gets.chomp.downcase
    if answer == "h"
      true
    elsif answer == "s"
      false
    else
      puts @messages[:dont_understand]
      player_hits?
    end
  end

  def show_hand(who)
    if who == @player # FIXME: refactor this
      print @messages[:player_hand]
    else
      print @messages[:dealer_hand]
    end
    who.hand.cards.each { |card| print " #{card.rank}#{card.suit}" }
    print "\n"
  end

  def show_dealer_first_hand
    print @messages[:dealer_hand]
    card = @dealer.hand.cards[0]
    puts " #{card.rank}#{card.suit} ??"
  end

  def dealer_wins
    binding.pry
    puts @messages[:dealer_wins]
  end

  def player_wins
    puts @messages[:player_wins]
    player.win(@pool * 2)
  end

  def end_game
    puts @messages[:no_money]
  end

  def reset_game
    @player.hand.empty
    @dealer.hand.empty
    @dealer.deck = Deck.new.shuffle! if @dealer.deck.cards.count <= 10
  end

  def pool # is this useful?
    @pool
  end
end

game = Game.new
game.play
