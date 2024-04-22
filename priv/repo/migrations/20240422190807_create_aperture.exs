defmodule FilmFlow.Repo.Migrations.CreateAperture do
  use Ecto.Migration

  def change do
    create table(:aperture) do
      add :value, :string

      timestamps(type: :utc_datetime)
    end
  end
end
