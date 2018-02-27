defmodule Hangman.Character do
  @list [
    ",'I am innocent'
  \t\t\t\t\t\t\t _________
  \t\t\t\t\t\t\t |        |
  \t\t\t\t\t\t\t |         
  \t\t\t\t\t\t\t |         
  \t\t\t\t\t\t\t |          
  \t\t\t\t\t\t\t |
  \t\t\t\t\t\t\t---
  	",
    ":'Don't hang me!
   \t\t\t\t\t\t\t _________
   \t\t\t\t\t\t\t|         |
   \t\t\t\t\t\t\t|         0
   \t\t\t\t\t\t\t|         
   \t\t\t\t\t\t\t|          
   \t\t\t\t\t\t\t|
   \t\t\t\t\t\t\t---

  	",
    ":'Help me!'
   \t\t\t\t\t\t\t _________
   \t\t\t\t\t\t\t|         |
   \t\t\t\t\t\t\t|         0
   \t\t\t\t\t\t\t|         |
   \t\t\t\t\t\t\t|          
   \t\t\t\t\t\t\t|
  \t\t\t\t\t\t\t---


  	",
    ":'Save me!'
    \t\t\t\t\t\t\t_________
   \t\t\t\t\t\t\t|         |
   \t\t\t\t\t\t\t|         0
   \t\t\t\t\t\t\t|         |\\
   \t\t\t\t\t\t\t|          
   \t\t\t\t\t\t\t|
  \t\t\t\t\t\t\t---

  	",
    ":'Please!!!'
   \t\t\t\t\t\t\t _________
   \t\t\t\t\t\t\t|         |
   \t\t\t\t\t\t\t|         0
   \t\t\t\t\t\t\t|        /|\\
   \t\t\t\t\t\t\t|          
   \t\t\t\t\t\t\t|
  \t\t\t\t\t\t\t---
  	",
    ":'I am dying!'
    \t\t\t\t\t\t\t_________
   \t\t\t\t\t\t\t|         |
   \t\t\t\t\t\t\t|         0
   \t\t\t\t\t\t\t|        /|\\
   \t\t\t\t\t\t\t|          \\
   \t\t\t\t\t\t\t|
  \t\t\t\t\t\t\t---
  	",
    ":'Meet me in heaven!'
    \t\t\t\t\t\t\t_________
   \t\t\t\t\t\t\t|         |
   \t\t\t\t\t\t\t|         0
   \t\t\t\t\t\t\t|        /|\\
   \t\t\t\t\t\t\t|        / \\
   \t\t\t\t\t\t\t|
  \t\t\t\t\t\t\t---
    "
  ]

  @doc """
  Function to print hangman character.
  """

  def print(name, chance) do
    IO.puts("\n\t\t\t\t\t\t\t" <> name <> Enum.at(@list, chance))
  end
end
