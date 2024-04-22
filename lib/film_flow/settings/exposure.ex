defmodule FilmFlow.Settings.Exposure do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exposures" do
    field :frame, :integer
    field :subject, :string
    field :date_exposed, :utc_datetime
    field :lighting_condition, :string
    field :notes, :string
    field :exposure_record, :id
    field :location, :id
    field :shutter_speed, :id
    field :camera, :id
    field :zone, :id
    field :lense, :id
    field :filter, :id
    field :tripod, :id
    field :holder, :id
    field :back, :id
    field :roll, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(exposure, attrs) do
    exposure
    |> cast(attrs, [:frame, :subject, :date_exposed, :lighting_condition, :notes])
    |> validate_required([:frame, :subject, :date_exposed, :lighting_condition, :notes])
  end
end
