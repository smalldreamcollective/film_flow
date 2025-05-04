defmodule FilmFlow.Repo.Migrations.CreateManufacturers do
  use Ecto.Migration

  def change do
    create table(:manufacturers) do
      add :name, :string
      add :url, :string

      timestamps(type: :utc_datetime)
    end
  end
end
