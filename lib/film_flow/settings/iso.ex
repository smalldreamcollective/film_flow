defmodule FilmFlow.Settings.ISO do
  use Ecto.Schema
  import Ecto.Changeset

  schema "iso" do
    field :value, :string
    field :description, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(iso, attrs) do
    iso
    |> cast(attrs, [:value, :description])
    |> validate_required([:value, :description])
  end
end
