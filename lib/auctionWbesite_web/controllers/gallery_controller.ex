defmodule AuctionWbesiteWeb.GalleryController do
  use AuctionWbesiteWeb, :controller
  alias AuctionWbesite.Repo, as: Repo
  alias AuctionWbesite.Artist, as: Artist
  alias AuctionWbesite.Art, as: Art

  def index(conn, _params) do
    data = Repo.all(Art) |> Repo.preload(:artist)
    conn
    |> assign(:data, data)
    |> assign(:current_id, AuctionWbesite.Agent.get_art_id)
    |> render("index.html")
  end
end
