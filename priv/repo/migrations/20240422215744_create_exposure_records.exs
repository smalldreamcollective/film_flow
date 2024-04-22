defmodule FilmFlow.Repo.Migrations.CreateExposureRecords do
  use Ecto.Migration

  def change do
    create table(:exposure_records) do
      add :reference_id, :string
      add :project_name, :string
      add :date_loaded, :utc_datetime
      add :date_exposed, :utc_datetime
      add :concept, :text
      add :photographer, references(:photographers, on_delete: :nothing)
      add :location, references(:locations, on_delete: :nothing)
      add :film, references(:film, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:exposure_records, [:photographer])
    create index(:exposure_records, [:location])
    create index(:exposure_records, [:film])
  end
end
