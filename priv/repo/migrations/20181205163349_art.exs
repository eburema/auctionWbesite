defmodule AuctionWbesite.Repo.Migrations.Art do
  use Ecto.Migration

  def change do
    alter table(:arts) do
      add :extern_id, :text
    end
  end
end
