defmodule FilmFlow.Repo.Migrations.AddManufacturerToTripods do
  use Ecto.Migration

  def up do
    alter table(:tripods) do
      add :manufacturer_id, references(:manufacturers)
    end

    create index(:tripods, [:manufacturer_id])
  end

  def down do
    drop index(:tripods, [:manufacturer_id])

    alter table(:tripods) do
      remove :manufacturer_id
    end
  end
end
