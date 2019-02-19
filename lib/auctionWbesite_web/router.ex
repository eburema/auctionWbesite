defmodule AuctionWbesiteWeb.Router do
  use AuctionWbesiteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", AuctionWbesiteWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/gallery", GalleryController, :index
    get "/bid", BidController, :index
    get "/dump", PageController, :dump
  end

end
