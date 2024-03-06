# Ruby: Hangman

# Description
Hangman is terminal based game where you guess the secret word. 
This project is part of The Odin Project and is written in Ruby. 

# Usage & Rules
Run the game by entering `ruby main.rb` in your terminal. 

Player will be greeted with game information followed by option to pick a letter to guess and try to guess the exact word. Player can either pick a letter to guess or guess the word. 

Each guess will display hint on the screen with matching letter and any unmatched letter will be shown. 

```
Please enter [1] for letter or [2] for word: 1
Pick a letter, a-z: n

n  _  n  _  _  _  _  i  t

Letter not in the secret word: e, s, d

You have 4 guesse(s) left
```

Anytime player guesses the word or all the letters player will greated with message and game ends.

If player is unable to guess the word after 10 guesses game will end. 

At any point during the game player is able to save the game, game will exit. And load the game as previous state. 

# Thought on the project
Getting more experience on class and inheritance. First encounter with serializing and deserializing was agonizing and long process. 

In this project I've create 3 different files, `main.rb`, `game.rb`, `game_module.rb`. 

`Hangman` class will run the game and calls instance of `Guess` class with `Game` class as it's parent and most of game logic is done in this two classes and their functions.

 I separated non critical function to `GameDisplay` and `GameFunction` modules. Things like text display, save and loading game. 



