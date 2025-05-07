defmodule FilmFlow.Settings.Manufacturer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "manufacturers" do
    field :name, :string
    field :url, :string
    has_many :lenses, FilmFlow.Settings.Lens
    has_many :tripods, FilmFlow.Settings.Tripod

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(manufacturer, attrs) do
    manufacturer
    |> cast(attrs, [:name, :url])
    |> validate_required([:name, :url])
  end
end
