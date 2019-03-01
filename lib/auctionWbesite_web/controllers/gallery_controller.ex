defmodule AuctionWbesiteWeb.GalleryController do
  import Ecto.Query
  use AuctionWbesiteWeb, :controller
  alias AuctionWbesite.Repo, as: Repo
  alias AuctionWbesite.Artist, as: Artist
  alias AuctionWbesite.Art, as: Art

  def index(conn, _params) do
  
    query = from u in Art, order_by: u.artist_id, order_by: u.title
        
    data = Repo.all(query) |> Repo.preload(:artist)
    
    conn
    |> assign(:data, data)
    |> assign(:current_id, AuctionWbesite.Agent.get_art_id)
    |> render("index.html")
  end
end
