defmodule AuctionWbesite.Repo.Migrations.AddBidder do
  use Ecto.Migration

  def change do
      alter table(:arts) do
        add :bidder, :string
      end
  end
end
