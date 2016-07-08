gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'flash_cards'

class FlashCardTest < Minitest::Test
  def test_it_has_a_question
    skip
    card = Card.new("What is the capital of Alaska?")
    assert_equal "What is the capital of Alaska?", card.question
  end

  def test_it_also_has_an_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "Juneau", card.answer
  end

  def test_guess_has_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Juneau", guess.response
  end

  def test_it_has_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal card, guess.card
  end

  def test_response_is_correct?
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal true, guess.correct?
  end

  def test_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_deck_can_take_cards
    card_1 = Card.new("What is the capital of Texas?", "Austin")
    card_2 = Card.new("How many miles away is the earth from the sun?", "93 million")
    card_3 = Card.new("Who is the best soccer player in the world?", "Ronaldo")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_deck_has_x_number_of_cards
    card_1 = Card.new("What is the capital of Texas?", "Austin")
    card_2 = Card.new("How many miles away is the earth from the sun?", "93 million")
    card_3 = Card.new("Who is the best soccer player in the world?", "Ronaldo")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal 3, deck.count
  end

  def test_round_has_a_deck
    card_1 = Card.new("What is the capital of Texas?", "Austin")
    card_2 = Card.new("How many miles away is the earth from the sun?", "93 million")
    card_3 = Card.new("Who is the best soccer player in the world?", "Ronaldo")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    assert_equal deck, round.deck
  end

  def test_guesses_returns_array
    skip
    card_1 = Card.new("What is the capital of Texas?", "Austin")
    card_2 = Card.new("How many miles away is the earth from the sun?", "93 million")
    card_3 = Card.new("Who is the best soccer player in the world?", "Ronaldo")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_round_has_the_current_card
    card_1 = Card.new("What is the capital of Texas?", "Austin")
    card_2 = Card.new("How many miles away is the earth from the sun?", "93 million")
    card_3 = Card.new("Who is the best soccer player in the world?", "Ronaldo")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.deck
    assert_equal card_1, round.current_card
  end

  def test_it_records_guess
    skip
    card_1 = Card.new("What is the capital of Texas?", "Austin")
    card_2 = Card.new("How many miles away is the earth from the sun?", "93 million")
    card_3 = Card.new("Who is the best soccer player in the world?", "Ronaldo")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.deck
    guess = Guess.new("Austin", card_1)
    round.record_guess("Austin")
    assert_equal 1, round.guesses.count
    assert_equal "Correct!", round.guesses.first.feedback
    round.record_guess("93 million")
    assert_equal 2, round.guesses.count
    assert_equal "Correct!", round.guesses.last.feedback
  end

  def test_it_returns_correct_number_of_guesses
    skip
    card_1 = Card.new("What is the capital of Texas?", "Austin")
    card_2 = Card.new("How many miles away is the earth from the sun?", "93 million")
    card_3 = Card.new("Who is the best soccer player in the world?", "Ronaldo")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.deck
    guess = Guess.new("Austin", card_1)
    round.record_guess("Austin")
    assert_equal 1, round.number_correct
  end

  def test_it_returns_percent_correct
    skip
    card_1 = Card.new("What is the capital of Texas?", "Austin")
    card_2 = Card.new("How many miles away is the earth from the sun?", "93 million")
    card_3 = Card.new("Who is the best soccer player in the world?", "Ronaldo")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.deck
    round.record_guess("Austin")
    round.record_guess("5")
    round.number_correct
    assert_equal 50, round.percent_correct
  end

  def test_start_puts_question
    skip
    card_1 = Card.new("What is the capital of Texas?", "Austin")
    card_2 = Card.new("How many miles away is the earth from the sun?", "93 million")
    card_3 = Card.new("Who is the best soccer player in the world?", "Ronaldo")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    assert_equal "What is the capital of Texas?", round.start
  end

  def test_it_generates_cards
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
    assert_equal "cards.txt", cards
  end


end
