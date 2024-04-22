defmodule FilmFlow.Settings.LightCondition do
  use Ecto.Schema
  import Ecto.Changeset

  schema "light_conditions" do
    field :name, :string
    field :description, :string
    field :url_icon, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(light_condition, attrs) do
    light_condition
    |> cast(attrs, [:name, :description, :url_icon])
    |> validate_required([:name, :description, :url_icon])
  end
end
