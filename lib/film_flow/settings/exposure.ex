defmodule FilmFlow.Settings.Exposure do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exposures" do
    field :frame, :integer
    field :subject, :string
    field :date_exposed, :utc_datetime
    field :lighting_condition, :string
    field :notes, :string
    belongs_to :exposure_record, FilmFlow.Settings.ExposureRecord
    belongs_to :location, FilmFlow.Settings.Location
    belongs_to :shutter_speed, FilmFlow.Settings.ShutterSpeed
    belongs_to :camera, FilmFlow.Settings.Camera
    belongs_to :zone, FilmFlow.Settings.Zone
    belongs_to :lens, FilmFlow.Settings.Lens
    belongs_to :filter, FilmFlow.Settings.Filter
    belongs_to :tripod, FilmFlow.Settings.Tripod
    belongs_to :holder, FilmFlow.Settings.Holder
    belongs_to :film_back, FilmFlow.Settings.FilmBack
    belongs_to :film_roll, FilmFlow.Settings.FilmRoll

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(exposure, attrs) do
    exposure
    |> cast(attrs, [
      :frame,
      :subject,
      :date_exposed,
      :lighting_condition,
      :notes,
      :exposure_record_id,
      :location_id,
      :shutter_speed_id,
      :camera_id,
      :zone_id,
      :lens_id,
      :filter_id,
      :tripod_id,
      :holder_id,
      :film_back_id,
      :film_roll_id
    ])
    |> validate_required([:frame, :subject, :date_exposed, :lighting_condition, :notes])
    |> foreign_key_constraint(:exposure_record_id)
    |> foreign_key_constraint(:location_id)
    |> foreign_key_constraint(:shutter_speed_id)
    |> foreign_key_constraint(:camera_id)
    |> foreign_key_constraint(:zone_id)
    |> foreign_key_constraint(:lens_id)
    |> foreign_key_constraint(:filter_id)
    |> foreign_key_constraint(:tripod_id)
    |> foreign_key_constraint(:holder_id)
    |> foreign_key_constraint(:film_back_id)
    |> foreign_key_constraint(:film_roll_id)
  end
end
