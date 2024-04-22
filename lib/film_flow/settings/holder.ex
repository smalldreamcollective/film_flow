defmodule FilmFlow.Settings.Holder do
  use Ecto.Schema
  import Ecto.Changeset

  schema "holders" do
    field :description, :string
    field :model, :string
    field :years, :string
    field :url_manual, :string
    field :url_additional_info, :string
    field :manufacturer, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(holder, attrs) do
    holder
    |> cast(attrs, [:model, :description, :years, :url_manual, :url_additional_info])
    |> validate_required([:model, :description, :years, :url_manual, :url_additional_info])
  end
end
