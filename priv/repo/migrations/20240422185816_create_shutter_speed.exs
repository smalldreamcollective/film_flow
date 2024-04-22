defmodule FilmFlow.Repo.Migrations.CreateShutterSpeed do
  use Ecto.Migration

  def change do
    create table(:shutter_speed) do
      add :value, :string

      timestamps(type: :utc_datetime)
    end
  end
end
