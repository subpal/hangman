defmodule HangTest do
  use ExUnit.Case
  doctest Hangman

  test "check won" do
    assert Hangman.Play.ifwon?(["s", "u", "b"], %{"s" => 1, "u" => 1, "b" => 1}) == true
  end

  test "check not won" do
    assert Hangman.Play.ifwon?(["s", "u", "b"], %{"s" => 1, "u" => 1}) == false
  end

  test "check word 1" do
    assert Hangman.Play.printword(["h", "a", "n", "g", "m", "a", "n"], %{
             "h" => 1,
             "a" => 1,
             "n" => 1
           }) == "han--an"
  end

  test "check word 2" do
    assert Hangman.Play.printword(["c", "o", "d", "e"], %{}) == "----"
  end

  test "check word 3" do
    assert Hangman.Play.printword(["c", "o", "d", "e"], %{"c" => 1, "o" => 1, "d" => 1, "e" => 1}) ==
             "code"
  end

  test "check make_tuple 1" do
    assert Hangman.Profile.make_tuple("Hangy 23") == {"Hangy", 23}
  end

  test "check make_tuple 2" do
    assert Hangman.Profile.make_tuple("subham 00") == {"subham", 0}
  end

  test "check update 1" do
    assert Hangman.Profile.update({"Hangy", 12}, "Hangy", 13) == {"Hangy", 13}
  end

  test "check update 2" do
    assert Hangman.Profile.update({"Hangman", 14}, "Hany", 15) == {"Hangman", 14}
  end
end
