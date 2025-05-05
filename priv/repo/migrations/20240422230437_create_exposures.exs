defmodule FilmFlow.Repo.Migrations.CreateExposures do
  use Ecto.Migration

  def change do
    create table(:exposures) do
      add :frame, :integer
      add :subject, :text
      add :date_exposed, :utc_datetime
      add :lighting_condition, :text
      add :notes, :text
      add :exposure_record, references(:exposure_records, on_delete: :nothing)
      add :location, references(:locations, on_delete: :nothing)
      add :shutter_speed, references(:shutter_speed, on_delete: :nothing)
      add :camera, references(:cameras, on_delete: :nothing)
      add :zone, references(:zones, on_delete: :nothing)
      add :lens, references(:lenses, on_delete: :nothing)
      add :filter, references(:filters, on_delete: :nothing)
      add :tripod, references(:tripods, on_delete: :nothing)
      add :holder, references(:holders, on_delete: :nothing)
      add :film_back, references(:film_backs, on_delete: :nothing)
      add :film_roll, references(:film_rolls, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:exposures, [:exposure_record])
    create index(:exposures, [:location])
    create index(:exposures, [:shutter_speed])
    create index(:exposures, [:camera])
    create index(:exposures, [:zone])
    create index(:exposures, [:lens])
    create index(:exposures, [:filter])
    create index(:exposures, [:tripod])
    create index(:exposures, [:holder])
    create index(:exposures, [:film_back])
    create index(:exposures, [:film_roll])
  end
end
