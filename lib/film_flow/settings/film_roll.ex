defmodule FilmFlow.Settings.FilmRoll do
  use Ecto.Schema
  import Ecto.Changeset

  schema "film_rolls" do
    field :name, :string
    field :description, :string
    field :reference_id, :string
    field :frames, :integer
    field :expirate_date, :utc_datetime
    field :manufacturer, :id
    field :film_type, :id
    field :format, :id
    field :iso, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(film_roll, attrs) do
    film_roll
    |> cast(attrs, [:reference_id, :name, :frames, :expirate_date, :description])
    |> validate_required([:reference_id, :name, :frames, :expirate_date, :description])
  end
end
