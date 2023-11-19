defmodule Webyep.Repo.Migrations.CreateAuctions do
  use Ecto.Migration

  def change do
    create table(:auctions) do
      add :name, :string
      add :description, :text
      add :status, :string, default: "created"
      add :start, :naive_datetime, default: nil
      add :end, :naive_datetime, default: nil

      timestamps()
    end
  end

  unique_index("auctions", [:id])
end
