defmodule Hangman.Profile do
  defp make_name(char, acc) do
    if ("a" <= char and char <= "z") or ("A" <= char and char <= "Z") do
      acc ++ [char]
    else
      acc
    end
  end

  defp make_score(char, acc) do
    if "0" <= char and char <= "9" do
      acc ++ [char]
    else
      acc
    end
  end

  defp make_tuple(row) do
    row = row |> String.codepoints()
    name = Enum.reduce(row, [], fn x, acc -> make_name(x, acc) end) |> List.to_string()

    score =
      Enum.reduce(row, [], fn x, acc -> make_score(x, acc) end) |> List.to_string()
      |> String.to_integer()

    {name, score}
  end

  defp match_name({name, score}, acc, entered_name) do
    if name == entered_name do
      acc + score
    else
      acc
    end
  end

  defp check_highest(score, list) do
    Enum.count(list, fn x -> elem(x, 1) > score end) == 0
  end

  defp update({name, score}, new_name, new_score) do
    if new_name == name do
      {name, new_score}
    else
      {name, score}
    end
  end

  defp write_list({name, score}, acc) do
    acc = acc ++ String.codepoints(name)
    acc = acc ++ [" "]
    acc = acc ++ [Integer.to_string(score)]
    acc = acc ++ ["\n"]
    acc
  end

  defp getleaderboard(x, acc) do
    acc ++
      [
        "\t\t\t\t\t\t\t" <>
          Integer.to_string(elem(x, 1)) <>
          "\t" <> elem(elem(x, 0), 0) <> "\t\t" <> Integer.to_string(elem(elem(x, 0), 1)) <> "\n"
      ]
  end

  def leaderboard() do
    tup = File.read("/home/siriuslight/Aviabird/hang/lib/data.txt")
    IO.puts("\t\t\t\t\t\t\tRank\tName\t\tScore\n")
    IO.puts("\t\t\t\t\t\t    ___________________________________\n")

    list =
      elem(tup, 1)
      |> String.split("\n")
      |> List.delete("")
      |> Enum.map(fn x -> make_tuple(x) end)
      |> Enum.sort(fn x, y -> elem(x, 1) >= elem(y, 1) end)
      |> Enum.with_index(1)
      |> Enum.reduce([], fn x, acc -> getleaderboard(x, acc) end)
      |> List.to_string()
      |> IO.puts()
  end

  def update_data(outcome, name) do
    tup = File.read("/home/siriuslight/Aviabird/hang/lib/data.txt")

    list =
      elem(tup, 1)
      |> String.split("\n")
      |> List.delete("")
      |> Enum.map(fn x -> make_tuple(x) end)

    name = name |> String.trim()
    score = Enum.reduce(list, 0, fn x, acc -> match_name(x, acc, name) end)

    if outcome == 1 do
      score = score + 1
    end

    list =
      if score >= 0 do
        list ++ [{name, score}]
      else
        list
      end

    list = Enum.map(list, fn x -> update(x, name, score) end) |> Enum.uniq()
    ishighest = check_highest(score, list)

    list = Enum.reduce(list, [], fn x, acc -> write_list(x, acc) end)

    data = list |> List.to_string()
    File.write("/home/siriuslight/Aviabird/hang/lib/data.txt", data)
    {ishighest, score}
  end
end
