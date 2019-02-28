defmodule AuctionWbesite.Agent do
  use Agent
  alias AuctionWbesite.Repo, as: Repo
  alias AuctionWbesite.Art, as: Art

  def start_link(_empty) do
    start_art = Repo.get_by(Art, id: 1)
    #start_art = %{current_bid: 1}

    Agent.start_link(fn -> {1, start_art.current_bid} end, name: __MODULE__)
  end

  def get_art_id() do
    Agent.get(__MODULE__, fn {id,_} -> id end )
  end

  def get_current_bid() do
    Agent.get(__MODULE__, fn {_, bid} -> bid end )
  end

  def set_art_id(id) do
    Agent.update(__MODULE__, fn {_, bid} -> {id, bid} end )
  end

  def set_current_bid(bid) do
    Agent.update(__MODULE__, fn {id, _} -> {id, bid} end )
  end

end
