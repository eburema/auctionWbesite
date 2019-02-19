defmodule AuctionWbesite.Art do
  use Ecto.Schema
  import Ecto.Changeset


  schema "arts" do
    field :current_bid, :integer
    field :description, :string
    field :title, :string
    field :extern_id, :string
    field :artist_id, :id
    field :bidder, :string
    belongs_to :artist, AuctionWbesite.Artist, define_field: false

    timestamps()
  end

  @doc false
  def changeset(art, attrs) do
    art
    |> cast(attrs, [:title, :description, :current_bid, :extern_id])
    |> validate_required([:title, :description, :current_bid, :extern_id])
  end
end
