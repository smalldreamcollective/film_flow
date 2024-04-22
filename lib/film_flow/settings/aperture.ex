defmodule FilmFlow.Settings.Aperture do
  use Ecto.Schema
  import Ecto.Changeset

  schema "aperture" do
    field :value, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(aperture, attrs) do
    aperture
    |> cast(attrs, [:value])
    |> validate_required([:value])
  end
end
