defmodule FilmFlow.Repo.Migrations.FixExposureForeignKeyIndexes do
  use Ecto.Migration

  def change do
    # This migration is no longer needed as the original CreateExposures migration
    # has been corrected.
    # Leaving this file in place to maintain migration history, but it will do nothing.
  end
end
