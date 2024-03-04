# Contains all classes for the game hangman.

require_relative 'game_module'

# Hangman class initialies the game
class Game
  include GameDisplay
  include GameFunction

  attr_accessor :secret_word

  def initialize
    @secret_word = random_word
  end

  # Game rounds
  def rounds()
    display_secret_hidden(secret_word)
  end

  # Hash the secret word with letter value set to false
  def hash_secret(random_word)
    # random_word.to_h { |value| [value, false] }
  end

  # Gets the randomly selected secret word and closes the open file
  def random_word
    # File.open('random_words.txt', 'r') { |word| word.readlines.sample.chomp.split('') }
    file = File.open('random_words.txt').select { |line| line.chomp.length >= 5 && line.chomp.length <= 12 }
    puts file.sample.chomp.split
  end
end

# Guess class
class Guess < Game
  attr_accessor :guesses, :letter, :word

  def initialize
    super
    @guesses_count = 10
    @letter
    @word
  end

  def guess_letter
    loop do
      puts game_info(:player_guess)
      letter = gets.chomp
    end
  end

  def guess_word

  end
end
