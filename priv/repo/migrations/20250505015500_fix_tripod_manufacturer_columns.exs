defmodule FilmFlow.Repo.Migrations.FixTripodManufacturerColumns do
  use Ecto.Migration

  def up do
    drop_if_exists index(:tripods, [:manufacturer_id])

    rename table(:tripods), :url_addtional_info, to: :url_additional_info

    alter table(:tripods) do
      remove :manufacturer_id
      add :manufacturer_id, references(:manufacturers)
    end

    create index(:tripods, [:manufacturer_id])
  end

  def down do
    drop index(:tripods, [:manufacturer_id])

    alter table(:tripods) do
      remove :manufacturer_id
      add :manufacturer_id, :integer
    end

    rename table(:tripods), :url_additional_info, to: :url_addtional_info
  end
end
