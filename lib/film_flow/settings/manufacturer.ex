defmodule FilmFlow.Settings.Manufacturer do
  use Ecto.Schema
  import Ecto.Changeset


  schema "manufacturers" do
    field :name, :string
    field :url, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(manufacturer, attrs) do
    manufacturer
    |> cast(attrs, [:name, :url])
    |> validate_required([:name])
    |> validate_format(:url, ~r/^https?\:\/\/[aA-zZ]+\.[aA-zZ]+\.[aA-zZ]{2,6}$/)
  end
end
