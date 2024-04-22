defmodule FilmFlow.Settings.Film do
  use Ecto.Schema
  import Ecto.Changeset

  schema "film" do
    field :name, :string
    field :description, :string
    field :manufacturer, :id
    field :film_type, :id
    field :format, :id
    field :iso, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(film, attrs) do
    film
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
