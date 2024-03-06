# frozen_string_literal: false

# Contains all classes for the game hangman.

require_relative 'game_module'

# Hangman class initialies the game
class Game
  include GameDisplay
  include GameFunction

  attr_accessor :secret_word, :running_guess, :not_in_word

  def initialize
    @secret_word = random_word
    @running_guess = Array.new(secret_word.length) { '_' }
    @not_in_word = ''
  end

  # Game round
  def round(letter_word)
    letter_word.length == 1 ? check_letter(letter_word) : won?(letter_word.split, secret_word)
    display_secret_hidden(running_guess)
    display_not_included_letters(not_in_word)
    won?(running_guess, secret_word)
  end

  def check_letter(letter_word)
    secret_word.each_with_index do |value, index|
      running_guess[index] = letter_word if value == letter_word
    end
    not_in_word.prepend(letter_word) unless secret_word.include?(letter_word)
  end

  # Gets the randomly selected secret word and closes the open file
  def random_word
    secret = File.open('random_words.txt').select { |word| word.chomp.length >= 5 && word.chomp.length <= 12 }
    secret.sample.chomp.split('')
  end
end

# Guess class
class Guess < Game
  def guess(mode)
    guess_letter if mode == 1
    guess_word if mode == 2
  end

  def guess_letter
    print game_info(:guess_letter)
    letter = gets.chomp.downcase
    letter.match?(/\A[a-z]*\z/) && letter.chomp.length == 1 ? round(letter) : guess_letter
  end

  def guess_word
    print game_info(:guess_word)
    word = gets.chomp.downcase
    length = word.length
    word.match?(/\A[a-z]*\z/) && length < 13 && length > 4 ? round(word) : guess_word
  end
end
