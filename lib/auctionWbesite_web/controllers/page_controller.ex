defmodule AuctionWbesiteWeb.PageController do
  import Ecto.Query
  use AuctionWbesiteWeb, :controller
  alias AuctionWbesite.Repo, as: Repo
  alias AuctionWbesite.Artist, as: Artist
  alias AuctionWbesite.Art, as: Art


  def index(conn, _params) do
    art_id = AuctionWbesite.Agent.get_art_id()
    cur_bid = AuctionWbesite.Agent.get_current_bid()
    query = from u in Art,
              join: c in Artist,
              where: (c.id == u.artist_id) and (u.id == ^art_id)

    result = Repo.one(query) |> Repo.preload(:artist)

    conn
    |> assign(:piece, result)
    |> assign(:bid, cur_bid)
    |> render("index.html")
  end
end
