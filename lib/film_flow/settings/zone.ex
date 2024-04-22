defmodule FilmFlow.Settings.Zone do
  use Ecto.Schema
  import Ecto.Changeset

  schema "zones" do
    field :name, :string
    field :description, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(zone, attrs) do
    zone
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
