defmodule FilmFlow.Settings.FilmBack do
  use Ecto.Schema
  import Ecto.Changeset

  schema "film_backs" do
    field :description, :string
    field :model, :string
    field :years, :string
    field :url_manual, :string
    field :url_additional_info, :string
    field :manufacturer, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(film_back, attrs) do
    film_back
    |> cast(attrs, [:model, :description, :years, :url_manual, :url_additional_info])
    |> validate_required([:model, :description, :years, :url_manual, :url_additional_info])
  end
end
