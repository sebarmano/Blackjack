# Blackjack
This is a command line Blackjack game. Player starts with $1000 to bet and the game ends when he loses all money.

To start the game enter:
`ruby game.rb`

## House Rules
- Dealer: hits with 16, stands with 17.
- If there are less than 10 cards at the beginning of the round, the deck is replaced by a whole new shuffled deck.

## About the code
### Comparable and Enumerable
There are no classes in the game in which makes sense to use the enumerable module. There are no clases in which I need to sort or search for any object. However for the Card class to pass the tests it needs to be comparable. So I used the comparable module in Card, redefining the <=> operator.

### Inheritance
Both player and dealer have some things in common: both can hit when it's their turn and both have a hand to play with. This attribute and method have been moved to a superclass Person of the subclasses Dealer and Player.

### To Do
- Finalize game tests for each feature of the game.
- Add "double-down" feature.
- Add "Blackjack" detection feature.
