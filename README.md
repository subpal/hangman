# Hangman

## Introduction
This is the elixir implementation of the classic Hangman game. It uses genserver and supervisor for fault tolerance.
## Requirements
1. Elixir version - 1.6.1
2. Mix
3. Linux/ Windows Operating System

## Instructions
1. Clone the hangman repository.
2. Get your terminal into the hangman directory.
3. Enter command `iex -S mix`, to compile the hangman game.
4. Enter command `Super.start_link` to start the process.
5. Now, the last `Game.start`.

Enjoy and have fun.

## Development details
The project is divided into modules for different functionality.

There are three basic modules :-

1. Hangman.Play : starts the game and uses functions of other necessary modules when required.
2. Hangman.Profile : stores the profile information about players, scores and leaderboard.
3. Hangman.Loadhangman : reads the file containing words and returns a random word.


Note: This is free to use and modify.
