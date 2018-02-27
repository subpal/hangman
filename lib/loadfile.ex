defmodule Hangman.LoadHangman do
  @moduledoc """
  Loads the word file and extract a random word from the file.
  """

  @doc """
  Reads the file containing word list and returns the list of words.
  """
  def getwordlist do
    File.read("/home/siriuslight/Aviabird/hang/lib/words1.txt")
    |> Tuple.to_list()
    |> List.last()
    |> String.split("\n")
    |> List.delete("")
  end

  @doc """
  Returns a random word from a list.
  """
  def getword do
    list = getwordlist()
    Enum.at(list, :rand.uniform(length(list) - 1))
  end
end
