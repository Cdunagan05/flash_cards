require 'pry'

class Card

  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  def question
    @question
  end

  def answer
    @answer
  end
end

class Guess

  def initialize(response, card)
    @response = response
    @card = card
  end

  def card
    @card
  end

  def response
    @response
  end

  def correct?
    if response == card.answer
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end

end

class Deck
  def initialize(cards)
    @cards = cards
  end

  def cards
    @cards
  end

  def count
    @cards.to_a.count
  end

end


class CardGenerator
  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def cards
    @cards
  end

  def gets_file
    gets_file = File.open(@filename, "r")

    gets_file.each_line do |line|
      questions_and_answers = line.split(",")
      @cards << Card.new(questions_and_answers[0], questions_and_answers[1])
    end
  end




end



class Round

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
    # @guess = Guess.new(@response, @card)
  end

  def deck
    @deck #<< Card.new(question, answer)
  end

  def current_card
    @current_card = deck.cards[@guesses.length]
  end

  def guess
    @guess
  end

  def record_guess(response)
    # @record_guess = @guess
    @guesses << Guess.new(response, current_card)
    if @guesses.last.correct?
      @number_correct += 1
    end
    @guesses.last
  end

  def percent_correct
    ((@number_correct/@guesses.length.to_f) * 100).to_i
  end

  def start
    puts "Welcome, You're playing with #{@deck.count} cards."

    deck.cards.each do |card|



      puts "This is card #{@guesses.length + 1} out of #{@deck.count}."
      puts card.question
      response = gets
      record_guess(response)
      puts @guesses.last.feedback


    end

    puts "Game Over"
    puts "You had #{@number_correct} correct guesses out of #{@deck.count} for a score of #{percent_correct}%. "


  end

end
