defmodule AuctionWbesiteWeb.BidController do
  use AuctionWbesiteWeb, :controller
  alias AuctionWbesite.Repo, as: Repo
  alias AuctionWbesite.Art, as: Art

  def index(conn, _params) do
    art_id = AuctionWbesite.Agent.get_art_id()
    current_bid = AuctionWbesite.Agent.get_current_bid()
    cur_art = Repo.get_by(Art, id: art_id)


    conn
    |> assign(:bid, current_bid)
    |> assign(:title, cur_art.title)
    |> assign(:bidder, cur_art.bidder)
    |> render("index.html")
  end
end
