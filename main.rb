# 03/03/2024 hangman

# Hangman this is a game of guesses! random word will be picked and all you need
# to do is guess the right word! simple but you only have 10 guesses so pick your
# letter wisely. So lets play!

require_relative 'lib/game'
require_relative 'lib/game_module'

# Start the game
class Hangman
  include GameDisplay
  include GameFunction

  def play_game
    puts game_info(:new)
    puts game_info(:rounds)
    new_game = Game.new
  end
end

Hangman.new.play_game
