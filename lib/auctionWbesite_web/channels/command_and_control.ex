defmodule AuctionWbesiteWeb.CommandAndControl do
  use Phoenix.Channel
  import Ecto.Query
  alias AuctionWbesite.Repo, as: Repo
  alias AuctionWbesite.Artist, as: Artist
  alias AuctionWbesite.Art, as: Art
  alias AuctionWbesite.Agent, as: Store

  def join("coc:1", _message, socket) do
    {:ok, socket}
  end

  def join("coc:" <> _other_coc_id, _params, _socket) do
    {:error, %{reason: "Not implemented"}}
  end

  def handle_in("art_id", %{"id" => id}, socket) do
    {new_id, ""} = Integer.parse(id)
    old_id = Store.get_art_id()
    old_bid = Store.get_current_bid()

    Repo.get_by(Art, id: old_id)
    |> Ecto.Changeset.change(%{current_bid: old_bid})
    |> Repo.update()

    query = from u in Art, where: u.id == ^new_id
    result = Repo.one(query) |> Repo.preload(:artist)

    Store.set_art_id(new_id)
    Store.set_current_bid(result.current_bid)

    return = %{id: id, title: result.title, description: result.description, artist: result.artist.name, bid: result.current_bid, extern: result.extern_id, bidder: result.bidder }
    broadcast!(socket, "new_art", return)

    {:noreply, socket}
  end

  def handle_in("new_bid", %{"bid" => bid}, socket) do
    {new_bid, ""} = Integer.parse(bid)
    Store.set_current_bid(new_bid)

    broadcast!(socket, "new_bid", %{bid: bid})
    {:noreply, socket}
  end

  def handle_in("new_bidder", %{"bidder" => new_bidder}, socket) do
    art_id = Store.get_art_id()

    Repo.get_by(Art, id: art_id)
    |> Ecto.Changeset.change(%{bidder: new_bidder})
    |> Repo.update()

    broadcast!(socket, "new_bidder", %{bidder: new_bidder})

    {:noreply, socket}
  end
end
