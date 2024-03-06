# frozen_string_literal: false

# 03/03/2024 hangman

# Hangman this is a game of guesses! random word will be picked and all you need
# to do is guess the right word! simple but you only have 10 guesses so pick your
# letter wisely. So lets play!
require 'json'
require_relative 'lib/game'
require_relative 'lib/game_module'

# Start the game
class Hangman
  include GameDisplay
  include GameFunction

  attr_accessor :score, :new_guess

  def initialize
    @score = 10
    @new_guess = Guess.new
  end

  def start_game
    puts game_info(:new)
    puts game_info(:rounds)
    play_rounds
  end

  def play_rounds
    score.times do
      puts game_info(:guess_left, score)
      new_guess.guess(game_mode)
      self.score -= 1
    end
    lost(new_guess.secret_word) if score.zero?
  end

  def game_mode
    print game_info(:guess_or_letter)
    mode = gets.chomp
    save_game(self) if mode.downcase == 'save'
    load_game(self) if mode.downcase == 'load'
    [1, 2].include?(mode.to_i) ? mode.to_i : game_mode
  end
end

Hangman.new.start_game
