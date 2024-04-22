defmodule FilmFlow.Settings.ExposureRecord do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exposure_records" do
    field :reference_id, :string
    field :project_name, :string
    field :date_loaded, :utc_datetime
    field :date_exposed, :utc_datetime
    field :concept, :string
    field :photographer, :id
    field :location, :id
    field :film, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(exposure_record, attrs) do
    exposure_record
    |> cast(attrs, [:reference_id, :project_name, :date_loaded, :date_exposed, :concept])
    |> validate_required([:reference_id, :project_name, :date_loaded, :date_exposed, :concept])
  end
end
