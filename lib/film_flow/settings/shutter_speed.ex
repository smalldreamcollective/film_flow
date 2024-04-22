defmodule FilmFlow.Settings.ShutterSpeed do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shutter_speed" do
    field :value, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(shutter_speed, attrs) do
    shutter_speed
    |> cast(attrs, [:value])
    |> validate_required([:value])
  end
end
