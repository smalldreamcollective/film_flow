defmodule FilmFlow.Settings.Lens do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lenses" do
    field :description, :string
    field :model, :string
    field :years, :string
    field :url_manual, :string
    field :url_additional_info, :string
    belongs_to :manufacturer, FilmFlow.Settings.Manufacturer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(lens, attrs) do
    lens
    |> cast(attrs, [
      :manufacturer_id,
      :model,
      :description,
      :years,
      :url_manual,
      :url_additional_info
    ])
    |> validate_required([:model, :manufacturer_id])
    |> foreign_key_constraint(:manufacturer_id)
  end
end
