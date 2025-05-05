defmodule FilmFlow.Repo.Migrations.RemoveBrandFromCameras do
  use Ecto.Migration

  def change do
    alter table(:cameras) do
      remove :brand
    end
  end
end
