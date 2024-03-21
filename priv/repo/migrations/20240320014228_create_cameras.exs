defmodule FilmFlow.Repo.Migrations.CreateCameras do
  use Ecto.Migration

  def change do
    create table(:cameras) do
      add :name, :string
      add :brand, :string
      add :model, :string

      timestamps(type: :utc_datetime)
    end
  end
end
