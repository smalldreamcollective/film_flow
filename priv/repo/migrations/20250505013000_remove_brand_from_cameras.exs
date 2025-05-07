defmodule FilmFlow.Repo.Migrations.RemoveBrandFromCameras do
  use Ecto.Migration

  def up do
    alter table(:cameras) do
      remove :brand
    end
  end

  def down do
    alter table(:cameras) do
      add :brand, :string
    end
  end
end
