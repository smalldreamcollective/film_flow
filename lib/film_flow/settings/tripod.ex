defmodule FilmFlow.Settings.Tripod do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tripods" do
    field :description, :string
    field :model, :string
    field :years, :string
    field :url_manual, :string
    field :url_additional_info, :string
    belongs_to :manufacturer, FilmFlow.Settings.Manufacturer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(tripod, attrs) do
    tripod
    |> cast(attrs, [
      :model,
      :description,
      :years,
      :url_manual,
      :url_additional_info,
      :manufacturer_id
    ])
    |> validate_required([
      :model,
      :description,
      :years,
      :url_manual,
      :url_additional_info,
      :manufacturer_id
    ])
    |> foreign_key_constraint(:manufacturer_id)
  end
end
