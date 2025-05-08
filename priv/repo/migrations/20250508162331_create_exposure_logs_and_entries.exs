defmodule FilmFlow.Repo.Migrations.CreateExposureLogsAndEntries do
  use Ecto.Migration

  def change do
    create table(:shoots) do
      add :name, :string
      add :description, :text
      add :date, :utc_datetime
      add :user_id, references(:users, on_delete: :delete_all)
      timestamps(type: :utc_datetime)
    end

    create index(:shoots, [:user_id])
  end
end
