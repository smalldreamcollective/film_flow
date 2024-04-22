defmodule FilmFlow.Settings.Tripod do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tripods" do
    field :description, :string
    field :model, :string
    field :years, :string
    field :url_manual, :string
    field :url_addtional_info, :string
    field :manufacture, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(tripod, attrs) do
    tripod
    |> cast(attrs, [:model, :description, :years, :url_manual, :url_addtional_info])
    |> validate_required([:model, :description, :years, :url_manual, :url_addtional_info])
  end
end
