defmodule FilmFlow.Repo.Migrations.UpdateCamerasManufacturer do
  use Ecto.Migration

  def up do
    alter table(:cameras) do
      add :manufacturer_ref, references(:manufacturers, on_delete: :nothing)
    end

    create index(:cameras, [:manufacturer_ref])

    # Copy data from manufacturer to manufacturer_ref
    execute "UPDATE cameras SET manufacturer_ref = manufacturer::bigint"

    alter table(:cameras) do
      remove :manufacturer
      remove :manufacturer_id
    end

    rename table(:cameras), :manufacturer_ref, to: :manufacturer
  end

  def down do
    rename table(:cameras), :manufacturer, to: :manufacturer_ref

    alter table(:cameras) do
      add :manufacturer, :string
      add :manufacturer_id, references(:manufacturers, on_delete: :nothing)
    end

    # Copy data back
    execute "UPDATE cameras SET manufacturer = manufacturer_ref::text"

    alter table(:cameras) do
      remove :manufacturer_ref
    end

    create index(:cameras, [:manufacturer_id])
  end
end
