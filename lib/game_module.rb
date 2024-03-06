# frozen_string_literal: false

# Contains all module for the game hangman.

# Game text information module
module GameDisplay
  def game_info(info, text = '')
    {
      new: "\nWelcome to Hangman!\nYou have 10 guesses.\nLets start!\n\n",
      rounds: "Secret word has been set!\n\n" \
        "Remember you can save the game at any point\n" \
        "by entering [save] or [load] to load game.\n\n",
      guess_or_letter: 'Please enter [1] for letter or [2] for word: ',
      guess_left: "You have #{text} guesse(s) left\n\n",
      saved: 'Game saved.',
      guess_letter: 'Pick a letter, a-z: ',
      guess_word: 'Guess the word, between 5 to 12 letters: ',
      lost: 'You lost, and the secret word was: '
    }[info]
  end

  def display_secret_hidden(secret)
    puts "\n#{secret.join('  ')}\n"
  end

  def display_not_included_letters(letter)
    puts "\nLetter not in the secret word: #{letter.split('').join(', ')}\n\n"
  end

  def display_secret(secret)
    puts secret.join('  ')
  end
end

# Game function module
module GameFunction
  def won?(guess, secret)
    return unless guess.join('') == secret.join('')

    puts "You've won!"
    display_secret(secret)
    exit
  end

  def save_file(saved_data)
    Dir.mkdir('saved') unless Dir.exist?('saved')
    File.open('saved/saved_game.json', 'w') do |f|
      f.write(saved_data)
    end
    puts game_info(:saved)
    exit
  end

  def save_game(obj)
    saved_data = {
      score: obj.score,
      secret_word: obj.new_guess.secret_word,
      running_guess: obj.new_guess.running_guess,
      not_in_word: obj.new_guess.not_in_word
    }.to_json
    save_file(saved_data)
  end

  def load_game(obj)
    saved_data = JSON.load_file('saved/saved_game.json')
    obj.score = saved_data['score']
    obj.new_guess.secret_word, = saved_data['secret_word']
    obj.new_guess.running_guess = saved_data['running_guess']
    obj.new_guess.not_in_word = saved_data['not_in_word']
    display_secret_hidden(obj.new_guess.running_guess)
    display_not_included_letters(obj.new_guess.not_in_word)
    play_rounds
  end

  def lost(secret)
    puts game_info(:lost)
    display_secret(secret)
    exit
  end

  def game_pause(int)
    sleep(int)
  end
end
