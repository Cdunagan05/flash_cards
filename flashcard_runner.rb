require_relative 'flash_cards'
require 'pry'


# card_1 = Card.new("What is the capital of Texas?", "Austin")
# card_2 = Card.new("Which planet is best?", "Pluto")
# card_3 = Card.new("How many inches are in a meter?", "39")
# card_4 = Card.new("How many pounds are in a metric ton?", "2,000")
# card_5 = Card.new("True or False: Bears Beats Battlestar Galactica?", "That's debatable")

new_card = CardGenerator.new("cards.txt")
new_card.gets_file
all_cards = new_card.cards




binding.pry
deck_1 = Deck.new(all_cards)
round_1 = Round.new(deck_1)


round_1.start
