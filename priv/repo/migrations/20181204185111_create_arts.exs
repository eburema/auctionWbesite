defmodule AuctionWbesite.Repo.Migrations.CreateArts do
  use Ecto.Migration

  def change do
    create table(:arts) do
      add :title, :string
      add :description, :string
      add :current_bid, :integer
      add :artist_id, references(:artists, on_delete: :nothing)

      timestamps()
    end

    create index(:arts, [:artist_id])
  end
end
