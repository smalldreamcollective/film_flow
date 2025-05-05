defmodule FilmFlow.Settings.Camera do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cameras" do
    field :name, :string
    field :model, :string
    belongs_to :manufacturer, FilmFlow.Settings.Manufacturer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(camera, attrs) do
    camera
    |> cast(attrs, [:name, :model, :manufacturer_id])
    |> validate_required([:name, :model, :manufacturer_id])
    |> foreign_key_constraint(:manufacturer_id)
  end
end
