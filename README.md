# Blackjack
This is a command line Blackjack game. Player starts with $1000 to bet and the game ends when he loses all money.

To start the game enter:
`./bin/blackjack` 

## House Rules
- Dealer: hits with 16, stands with 17.
- If there are less than 10 cards at the beginning of the round, the deck is replaced by a whole new shuffled deck.

## About the code
### Comparable and Enumerable
- Hand class is Enumerable.
- Card class is Comparable.

### Inheritance
Both player and dealer have some things in common: both can hit when it's their turn and both have a hand to play with. This attribute and method have been moved to a superclass Person of the subclasses Dealer and Player.

### To Do
- Finalize game tests for each feature of the game.
- Add "double-down" feature.
- Add "Blackjack" detection feature.
