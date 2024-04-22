defmodule FilmFlow.Repo.Migrations.CreateFormat do
  use Ecto.Migration

  def change do
    create table(:format) do
      add :name, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
