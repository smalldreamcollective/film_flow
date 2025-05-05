defmodule FilmFlow.Repo.Migrations.CreateLenses do
  use Ecto.Migration

  def change do
    create table(:lenses) do
      add :model, :string
      add :description, :text
      add :years, :string
      add :url_manual, :string
      add :url_additional_info, :string
      add :manufacturer_id, references(:manufacturers, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:lenses, [:manufacturer_id])
  end
end
