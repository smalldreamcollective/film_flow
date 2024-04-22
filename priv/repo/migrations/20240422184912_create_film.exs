defmodule FilmFlow.Repo.Migrations.CreateFilm do
  use Ecto.Migration

  def change do
    create table(:film) do
      add :name, :string
      add :description, :text
      add :manufacturer, references(:manufacturers, on_delete: :nothing)
      add :film_type, references(:film_type, on_delete: :nothing)
      add :format, references(:format, on_delete: :nothing)
      add :iso, references(:iso, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:film, [:manufacturer])
    create index(:film, [:film_type])
    create index(:film, [:format])
    create index(:film, [:iso])
  end
end
