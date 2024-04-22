defmodule FilmFlow.Repo.Migrations.CreateFilmType do
  use Ecto.Migration

  def change do
    create table(:film_type) do
      add :name, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
