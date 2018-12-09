defmodule AuctionWbesiteWeb.LayoutView do
  use AuctionWbesiteWeb, :view

  def title do
    "Site for live auction with OBS"
  end

  def gen_title(view) do
    view.title
  end

  def view_name(view) do
    view
    |> Phoenix.Naming.resource_name
    |> String.replace("_view", "")
  end

end
