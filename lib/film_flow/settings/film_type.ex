defmodule FilmFlow.Settings.FilmType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "film_type" do
    field :name, :string
    field :description, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(film_type, attrs) do
    film_type
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
