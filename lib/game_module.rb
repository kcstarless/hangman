# Contains all module for the game hangman.

# Game text information module
module GameDisplay
  def game_info(info)
    {
      new: "Welcome to Hangman!\nYou have 10 guesses.\nLets start!",
      rounds: 'Secret word has been set! Can you guess the word?',
      player_guess: 'Pick your letter: '
    }[info]
  end

  def display_secret_hidden(secret)
    secret.each do |key, value|
      if value == false
        print '_ '
      else
        print key + ' '
      end
    end
    puts ""
  end
end

# Game function module
module GameFunction
  def game_pause(int)
    sleep(int)
  end

  # def guess(letter_picked, secret)
  #   if secret.include?(letter_picked)
  #     secret[letter_picked] = true
  #   else
  #     return
  #   end
  # end
end
