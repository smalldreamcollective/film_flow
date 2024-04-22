defmodule FilmFlow.Settings.Photographer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "photographers" do
    field :first_name, :string
    field :middle_name, :string
    field :last_name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(photographer, attrs) do
    photographer
    |> cast(attrs, [:first_name, :middle_name, :last_name])
    |> validate_required([:first_name, :middle_name, :last_name])
  end
end
