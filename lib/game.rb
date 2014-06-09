require 'pry'
require 'player'
require 'dealer'
require 'pool'
require 'deck'

class Game
  def initialize
    deck = Deck.new
    @dealer = Dealer.new(deck)
    @player = Player.new(1000)
    @pool = Pool.new
  end

  def welcome
    puts ''
    puts "** BLACKJACK TIME !! **"
    play
  end

  def play
    reset_game
    bet_made = bet
    bet unless bet_made
    round_start
    player_turn
    player_turn_end
    dealer_turn unless @player.hand.busted?
    round_end
  end

  def bet
    puts ''
    puts "You have $#{@player.money}"
    print "Make your bet: "
    bet = gets.to_i
    if can_bet?(bet)
      @player.bet(bet)
      @pool.add_bet(bet)
      true
    else
      puts "Bet not possible, try again."
      false
    end
  end

  def round_start
    2.times do
      @player.hit(@dealer.deal)
      @dealer.draw
    end
    show_hand(@player)
    print "Dealer first cards >"
    show_dealer_first_hand
  end

  def player_turn
    while player_hits?
      puts "One more card for the Player!"
      @player.hit(@dealer.deal)
      show_hand(@player)
      break if @player.hand.busted?
    end
  end

  def player_turn_end
    if @player.hand.busted?
      puts "You busted! (Your hand sums #{@player.hand.sum})\nDealer wins."
      player_loses
    else
      puts "Player stands! Your hand sum is #{@player.hand.sum}.\nIt's Dealer turn..."
    end
  end

  def dealer_turn
    while @dealer.hand.sum < 17
      @dealer.draw
      break if @dealer.hand.busted?
    end
    show_hand(@dealer)
  end

  def round_end
    if @dealer.hand.busted?
      puts "Dealer busted! (Hand sum is #{@dealer.hand.sum})"
      player_wins
    elsif @player.hand.sum <= @dealer.hand.sum
      puts "Dealer wins. (Hand sum is #{@dealer.hand.sum})"
      player_loses
    else
      "Player wins! Dealer hand sum is #{@dealer.hand.sum}"
      player_wins
    end
  end

  def can_bet?(bet)
    bet > 0 && bet <= @player.money
  end

  def player_hits?
    answer = ''
    while answer != 'h' && answer != 's'
      print "Do you want to (H)it or (S)tand? "
      answer = gets.chomp.downcase
      if answer == "h"
        return true
      elsif answer == "s"
        return false
      end
    end
  end

  def show_hand(who)
    if who == @player # FIXME: refactor this
      print "Your cards >"
    else
      print "Dealer cards >"
    end
    who.hand.cards.each { |card| print " #{card.rank}#{card.suit}" }
    print "\n"
  end

  def show_dealer_first_hand
    print "Dealer first cards >"
    card = @dealer.hand.cards[0]
    puts " #{card.rank}#{card.suit} ??"
  end

  def player_loses
    puts "You've lost $#{@pool.money}."
    @player.money > 0 ? play : end_game
  end

  def player_wins
    puts "Player wins! You've won $#{@pool.money}."
    @player.win(@pool.money * 2)
  end

  def end_game
    puts "You don't have any money left. Better luck next time"
  end

  def reset_game
    @player.hand.empty
    @dealer.hand.empty
    @dealer.deck = Deck.new.shuffle! if @dealer.deck.cards.count <= 10
    @pool.reset
  end

  def pool # is this useful?
    @pool
  end
end

# game = Game.new.welcome
