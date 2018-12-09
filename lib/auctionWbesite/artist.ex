defmodule AuctionWbesite.Artist do
  use Ecto.Schema
  import Ecto.Changeset


  schema "artists" do
    field :name, :string
    has_many :arts, AuctionWbesite.Art, foreign_key: :artist_id, references: :id

    timestamps()
  end

  @doc false
  def changeset(artist, attrs) do
    artist
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
