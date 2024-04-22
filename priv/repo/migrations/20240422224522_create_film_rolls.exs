defmodule FilmFlow.Repo.Migrations.CreateFilmRolls do
  use Ecto.Migration

  def change do
    create table(:film_rolls) do
      add :reference_id, :string
      add :name, :string
      add :frames, :integer
      add :expirate_date, :utc_datetime
      add :description, :text
      add :manufacturer, references(:manufacturers, on_delete: :nothing)
      add :film_type, references(:film_type, on_delete: :nothing)
      add :format, references(:format, on_delete: :nothing)
      add :iso, references(:iso, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:film_rolls, [:manufacturer])
    create index(:film_rolls, [:film_type])
    create index(:film_rolls, [:format])
    create index(:film_rolls, [:iso])
  end
end
