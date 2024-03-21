defmodule FilmFlow.Camera do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cameras" do
    field :name, :string
    field :brand, :string
    field :model, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(camera, attrs) do
    camera
    |> cast(attrs, [:name, :brand, :model])
    |> validate_required([:name, :brand, :model])
  end
end
