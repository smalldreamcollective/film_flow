defmodule FilmFlow.Repo.Migrations.FixTripodManufacturer do
  use Ecto.Migration

  def up do
    drop_if_exists index(:tripods, [:manufacture])

    alter table(:tripods) do
      remove :manufacture
    end
  end

  def down do
    alter table(:tripods) do
      add :manufacture, :string
    end

    create index(:tripods, [:manufacture])
  end
end
