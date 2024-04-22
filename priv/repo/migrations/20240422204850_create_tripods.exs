defmodule FilmFlow.Repo.Migrations.CreateTripods do
  use Ecto.Migration

  def change do
    create table(:tripods) do
      add :model, :string
      add :description, :text
      add :years, :string
      add :url_manual, :string
      add :url_addtional_info, :string
      add :manufacture, references(:manufacturers, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:tripods, [:manufacture])
  end
end
