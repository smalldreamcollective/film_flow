defmodule FilmFlow.Repo.Migrations.CreateExposures do
  use Ecto.Migration

  def change do
    create table(:exposures) do
      add :frame, :integer
      add :subject, :text
      add :date_exposed, :utc_datetime
      add :lighting_condition, :text
      add :notes, :text

      add :exposure_record_id, references(:exposure_records, column: :id, on_delete: :nothing),
        null: true

      add :location_id, references(:locations, column: :id, on_delete: :nothing), null: true

      add :shutter_speed_id, references(:shutter_speed, column: :id, on_delete: :nothing),
        null: true

      add :camera_id, references(:cameras, column: :id, on_delete: :nothing), null: true
      add :zone_id, references(:zones, column: :id, on_delete: :nothing), null: true
      add :lens_id, references(:lenses, column: :id, on_delete: :nothing), null: true
      add :filter_id, references(:filters, column: :id, on_delete: :nothing), null: true
      add :tripod_id, references(:tripods, column: :id, on_delete: :nothing), null: true
      add :holder_id, references(:holders, column: :id, on_delete: :nothing), null: true
      add :film_back_id, references(:film_backs, column: :id, on_delete: :nothing), null: true
      add :film_roll_id, references(:film_rolls, column: :id, on_delete: :nothing), null: true

      timestamps(type: :utc_datetime)
    end

    create index(:exposures, [:exposure_record_id])
    create index(:exposures, [:location_id])
    create index(:exposures, [:shutter_speed_id])
    create index(:exposures, [:camera_id])
    create index(:exposures, [:zone_id])
    create index(:exposures, [:lens_id])
    create index(:exposures, [:filter_id])
    create index(:exposures, [:tripod_id])
    create index(:exposures, [:holder_id])
    create index(:exposures, [:film_back_id])
    create index(:exposures, [:film_roll_id])
  end
end
