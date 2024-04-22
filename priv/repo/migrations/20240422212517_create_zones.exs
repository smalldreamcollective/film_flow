defmodule FilmFlow.Repo.Migrations.CreateZones do
  use Ecto.Migration

  def change do
    create table(:zones) do
      add :name, :string
      add :description, :text

      timestamps(type: :utc_datetime)
    end
  end
end
