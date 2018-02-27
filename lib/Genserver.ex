defmodule Game do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: :game)
  end

  def init(_) do
    {:ok, []}
  end

  def start() do
    GenServer.cast(:game, {:start})
  end

  # Callbacks

  def handle_cast({:start}, state) do
    Hangman.Play.start_game()
    {:noreply, state}
  end
end
