defmodule FilmFlow.Repo.Migrations.CreateLightConditions do
  use Ecto.Migration

  def change do
    create table(:light_conditions) do
      add :name, :string
      add :description, :text
      add :url_icon, :string

      timestamps(type: :utc_datetime)
    end
  end
end
