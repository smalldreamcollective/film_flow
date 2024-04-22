defmodule FilmFlow.Repo.Migrations.CreatePhotographers do
  use Ecto.Migration

  def change do
    create table(:photographers) do
      add :first_name, :string
      add :middle_name, :string
      add :last_name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
