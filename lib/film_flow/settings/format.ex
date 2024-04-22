defmodule FilmFlow.Settings.Format do
  use Ecto.Schema
  import Ecto.Changeset

  schema "format" do
    field :name, :string
    field :description, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(format, attrs) do
    format
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
