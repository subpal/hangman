defmodule Hangman.Play do
  @doc """
  Check if player has won or not.
  """
  def ifwon?(test_list, map) do
    Enum.count(test_list, fn x -> map[x] == nil end) == 0
  end

  defp helper_printword(char, acc, map) do
    if map[char] != nil do
      acc ++ [char]
    else
      acc ++ ["-"]
    end
  end

  def printword(test_list, map) do
    list = Enum.reduce(test_list, [], fn x, acc -> helper_printword(x, acc, map) end)
    word = List.to_string(list)
  end

  @doc """
  Infinite main function, which runs until player wins or looses.
  """
  def mainloop(chances, test_list, map, test_map, name) do
    if chances == 0 do
      IO.puts("\n\t\t\t\t\t\t\tYou lost!")
      tup = Hangman.Profile.update_data(0, name)
      ishigh = elem(tup, 0)
      score = elem(tup, 1)

      if ishigh do
        IO.puts("\n\t\t\t\t\t\t\tCongratulations! You are the highest scorer.")
      end

      IO.puts("\n\t\t\t\t\t\t\tScore : " <> to_string(score))
    else
      char =
        IO.gets("\n\n\t\t\t\t\t\t\tEnter your letter : ")
        |> String.trim()
        |> String.downcase()
        |> String.codepoints()
        |> Enum.at(0)

      if map[char] != nil do
        IO.puts("\n\t\t\t\t\t\t\tYou have already used " <> "'" <> char <> "'")
      else
        if test_map[char] != nil do
          IO.puts("\n\t\t\t\t\t\t\tCorrect move!")
          map = Map.put(map, char, 1)
          IO.puts("\n\t\t\t\t\t\t\t" <> printword(test_list, map))
          IO.puts("\n\t\t\t\t\t\t\tChances left : " <> Integer.to_string(chances))
        else
          Hangman.Character.print("Subham", 7 - chances)
          chances = chances - 1
          IO.puts("\n\t\t\t\t\t\t\tChances left : " <> Integer.to_string(chances))
        end
      end

      if ifwon?(test_list, map) do
        IO.puts("\n\t\t\t\t\t\t\tYou Won!")
        tup = Hangman.Profile.update_data(1, name)
        ishigh = elem(tup, 0)
        score = elem(tup, 1) |> Integer.to_string()

        if ishigh do
          IO.puts("\n\t\t\t\t\t\t\tCongratulations! You are highest scorer.")
        end

        IO.puts("\n\t\t\t\t\t\t\tScore : " <> score)
      else
        mainloop(chances, test_list, map, test_map, name)
      end
    end
  end

  @doc """
  Starter function to begin the game.
  """
  def start_game do
    Hangman.Logo.printlogo()

    ch =
      IO.gets("\t\t\t\t\t\t\tEnter : 1. Play\n
             \t\t\t\t\t\t\t2. View Leaderboard\n
             \t\t\t\t\t\t\tChoice: ")
      |> String.trim()
      |> String.to_integer()

    if ch == 1 do
      name = IO.gets("\n\t\t\t\t\t\t\tEnter your name : ") |> String.trim()
      test_word = Hangman.LoadHangman.getword() |> String.downcase()
      map = %{}
      test_list = test_word |> String.codepoints()
      test_map = Enum.reduce(test_list, %{}, fn x, acc -> Map.put(acc, x, 1) end)
      chances = 7
      mainloop(chances, test_list, map, test_map, name)
    else
      Hangman.Profile.leaderboard()
    end
  end
end
