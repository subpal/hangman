defmodule HangTest do
  use ExUnit.Case
  doctest Hang

  test "greets the world" do
    assert Hang.hello() == :world
  end
end
