defmodule FilmFlow.Repo.Migrations.CreateIso do
  use Ecto.Migration

  def change do
    create table(:iso) do
      add :value, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
