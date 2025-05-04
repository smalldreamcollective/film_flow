defmodule FilmFlow.Repo.Migrations.AddManufactueresToCameras do
  use Ecto.Migration

  def change do
    alter table(:cameras) do
      add :manufacturer, :string
      add :manufacturer_id, references(:manufacturers, on_delete: :nothing)
    end

    create index(:cameras, [:manufacturer_id])
  end
end
