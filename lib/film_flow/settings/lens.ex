defmodule FilmFlow.Settings.Lens do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lenses" do
    field :manufacturer, :id
    field :description, :string
    field :model, :string
    field :years, :string
    field :url_manual, :string
    field :url_additional_info, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(lens, attrs) do
    lens
    |> cast(attrs, [:manufacturer, :model, :description, :years, :url_manual, :url_additional_info])
    |> validate_required([:model])
  end
end
