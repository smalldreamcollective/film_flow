defmodule FilmFlow.Settings do
  @moduledoc """
  The Settings context.
  """

  import Ecto.Query, warn: false
  alias FilmFlow.Repo

  alias FilmFlow.Settings.Camera

  @doc """
  Returns the list of cameras.

  ## Examples

      iex> list_cameras()
      [%Camera{}, ...]

  """
  def list_cameras do
    Repo.all(Camera)
  end

  @doc """
  Gets a single camera.

  Raises `Ecto.NoResultsError` if the Camera does not exist.

  ## Examples

      iex> get_camera!(123)
      %Camera{}

      iex> get_camera!(456)
      ** (Ecto.NoResultsError)

  """
  def get_camera!(id), do: Repo.get!(Camera, id)

  @doc """
  Creates a camera.

  ## Examples

      iex> create_camera(%{field: value})
      {:ok, %Camera{}}

      iex> create_camera(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_camera(attrs \\ %{}) do
    %Camera{}
    |> Camera.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a camera.

  ## Examples

      iex> update_camera(camera, %{field: new_value})
      {:ok, %Camera{}}

      iex> update_camera(camera, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_camera(%Camera{} = camera, attrs) do
    camera
    |> Camera.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a camera.

  ## Examples

      iex> delete_camera(camera)
      {:ok, %Camera{}}

      iex> delete_camera(camera)
      {:error, %Ecto.Changeset{}}

  """
  def delete_camera(%Camera{} = camera) do
    Repo.delete(camera)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking camera changes.

  ## Examples

      iex> change_camera(camera)
      %Ecto.Changeset{data: %Camera{}}

  """
  def change_camera(%Camera{} = camera, attrs \\ %{}) do
    Camera.changeset(camera, attrs)
  end

  alias FilmFlow.Settings.Manufacturer

  @doc """
  Returns the list of manufacturers.

  ## Examples

      iex> list_manufacturers()
      [%Manufacturer{}, ...]

  """
  def list_manufacturers do
    Repo.all(Manufacturer)
  end

  @doc """
  Gets a single manufacturer.

  Raises `Ecto.NoResultsError` if the Manufacturer does not exist.

  ## Examples

      iex> get_manufacturer!(123)
      %Manufacturer{}

      iex> get_manufacturer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_manufacturer!(id), do: Repo.get!(Manufacturer, id)

  @doc """
  Creates a manufacturer.

  ## Examples

      iex> create_manufacturer(%{field: value})
      {:ok, %Manufacturer{}}

      iex> create_manufacturer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_manufacturer(attrs \\ %{}) do
    %Manufacturer{}
    |> Manufacturer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a manufacturer.

  ## Examples

      iex> update_manufacturer(manufacturer, %{field: new_value})
      {:ok, %Manufacturer{}}

      iex> update_manufacturer(manufacturer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_manufacturer(%Manufacturer{} = manufacturer, attrs) do
    manufacturer
    |> Manufacturer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a manufacturer.

  ## Examples

      iex> delete_manufacturer(manufacturer)
      {:ok, %Manufacturer{}}

      iex> delete_manufacturer(manufacturer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_manufacturer(%Manufacturer{} = manufacturer) do
    Repo.delete(manufacturer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking manufacturer changes.

  ## Examples

      iex> change_manufacturer(manufacturer)
      %Ecto.Changeset{data: %Manufacturer{}}

  """
  def change_manufacturer(%Manufacturer{} = manufacturer, attrs \\ %{}) do
    Manufacturer.changeset(manufacturer, attrs)
  end

  alias FilmFlow.Settings.Lens

  @doc """
  Returns the list of lenses.

  ## Examples

      iex> list_lenses()
      [%Lens{}, ...]

  """
  def list_lenses do
    Repo.all(Lens)
  end

  @doc """
  Gets a single lens.

  Raises `Ecto.NoResultsError` if the Lens does not exist.

  ## Examples

      iex> get_lens!(123)
      %Lens{}

      iex> get_lens!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lens!(id), do: Repo.get!(Lens, id)

  @doc """
  Creates a lens.

  ## Examples

      iex> create_lens(%{field: value})
      {:ok, %Lens{}}

      iex> create_lens(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lens(attrs \\ %{}) do
    %Lens{}
    |> Lens.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lens.

  ## Examples

      iex> update_lens(lens, %{field: new_value})
      {:ok, %Lens{}}

      iex> update_lens(lens, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lens(%Lens{} = lens, attrs) do
    lens
    |> Lens.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a lens.

  ## Examples

      iex> delete_lens(lens)
      {:ok, %Lens{}}

      iex> delete_lens(lens)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lens(%Lens{} = lens) do
    Repo.delete(lens)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lens changes.

  ## Examples

      iex> change_lens(lens)
      %Ecto.Changeset{data: %Lens{}}

  """
  def change_lens(%Lens{} = lens, attrs \\ %{}) do
    Lens.changeset(lens, attrs)
  end


  alias FilmFlow.Settings.Format

  @doc """
  Returns the list of format.

  ## Examples

      iex> list_format()
      [%Format{}, ...]

  """
  def list_format do
    Repo.all(Format)
  end

  @doc """
  Gets a single format.

  Raises `Ecto.NoResultsError` if the Format does not exist.

  ## Examples

      iex> get_format!(123)
      %Format{}

      iex> get_format!(456)
      ** (Ecto.NoResultsError)

  """
  def get_format!(id), do: Repo.get!(Format, id)

  @doc """
  Creates a format.

  ## Examples

      iex> create_format(%{field: value})
      {:ok, %Format{}}

      iex> create_format(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_format(attrs \\ %{}) do
    %Format{}
    |> Format.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a format.

  ## Examples

      iex> update_format(format, %{field: new_value})
      {:ok, %Format{}}

      iex> update_format(format, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_format(%Format{} = format, attrs) do
    format
    |> Format.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a format.

  ## Examples

      iex> delete_format(format)
      {:ok, %Format{}}

      iex> delete_format(format)
      {:error, %Ecto.Changeset{}}

  """
  def delete_format(%Format{} = format) do
    Repo.delete(format)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking format changes.

  ## Examples

      iex> change_format(format)
      %Ecto.Changeset{data: %Format{}}

  """
  def change_format(%Format{} = format, attrs \\ %{}) do
    Format.changeset(format, attrs)
  end

  alias FilmFlow.Settings.ISO

  @doc """
  Returns the list of iso.

  ## Examples

      iex> list_iso()
      [%ISO{}, ...]

  """
  def list_iso do
    Repo.all(ISO)
  end

  @doc """
  Gets a single iso.

  Raises `Ecto.NoResultsError` if the Iso does not exist.

  ## Examples

      iex> get_iso!(123)
      %ISO{}

      iex> get_iso!(456)
      ** (Ecto.NoResultsError)

  """
  def get_iso!(id), do: Repo.get!(ISO, id)

  @doc """
  Creates a iso.

  ## Examples

      iex> create_iso(%{field: value})
      {:ok, %ISO{}}

      iex> create_iso(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_iso(attrs \\ %{}) do
    %ISO{}
    |> ISO.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a iso.

  ## Examples

      iex> update_iso(iso, %{field: new_value})
      {:ok, %ISO{}}

      iex> update_iso(iso, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_iso(%ISO{} = iso, attrs) do
    iso
    |> ISO.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a iso.

  ## Examples

      iex> delete_iso(iso)
      {:ok, %ISO{}}

      iex> delete_iso(iso)
      {:error, %Ecto.Changeset{}}

  """
  def delete_iso(%ISO{} = iso) do
    Repo.delete(iso)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking iso changes.

  ## Examples

      iex> change_iso(iso)
      %Ecto.Changeset{data: %ISO{}}

  """
  def change_iso(%ISO{} = iso, attrs \\ %{}) do
    ISO.changeset(iso, attrs)
  end

  alias FilmFlow.Settings.FilmType

  @doc """
  Returns the list of film_type.

  ## Examples

      iex> list_film_type()
      [%FilmType{}, ...]

  """
  def list_film_type do
    Repo.all(FilmType)
  end

  @doc """
  Gets a single film_type.

  Raises `Ecto.NoResultsError` if the Film type does not exist.

  ## Examples

      iex> get_film_type!(123)
      %FilmType{}

      iex> get_film_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_film_type!(id), do: Repo.get!(FilmType, id)

  @doc """
  Creates a film_type.

  ## Examples

      iex> create_film_type(%{field: value})
      {:ok, %FilmType{}}

      iex> create_film_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_film_type(attrs \\ %{}) do
    %FilmType{}
    |> FilmType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a film_type.

  ## Examples

      iex> update_film_type(film_type, %{field: new_value})
      {:ok, %FilmType{}}

      iex> update_film_type(film_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_film_type(%FilmType{} = film_type, attrs) do
    film_type
    |> FilmType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a film_type.

  ## Examples

      iex> delete_film_type(film_type)
      {:ok, %FilmType{}}

      iex> delete_film_type(film_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_film_type(%FilmType{} = film_type) do
    Repo.delete(film_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking film_type changes.

  ## Examples

      iex> change_film_type(film_type)
      %Ecto.Changeset{data: %FilmType{}}

  """
  def change_film_type(%FilmType{} = film_type, attrs \\ %{}) do
    FilmType.changeset(film_type, attrs)
  end

  alias FilmFlow.Settings.Film

  @doc """
  Returns the list of film.

  ## Examples

      iex> list_film()
      [%Film{}, ...]

  """
  def list_film do
    Repo.all(Film)
  end

  @doc """
  Gets a single film.

  Raises `Ecto.NoResultsError` if the Film does not exist.

  ## Examples

      iex> get_film!(123)
      %Film{}

      iex> get_film!(456)
      ** (Ecto.NoResultsError)

  """
  def get_film!(id), do: Repo.get!(Film, id)

  @doc """
  Creates a film.

  ## Examples

      iex> create_film(%{field: value})
      {:ok, %Film{}}

      iex> create_film(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_film(attrs \\ %{}) do
    %Film{}
    |> Film.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a film.

  ## Examples

      iex> update_film(film, %{field: new_value})
      {:ok, %Film{}}

      iex> update_film(film, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_film(%Film{} = film, attrs) do
    film
    |> Film.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a film.

  ## Examples

      iex> delete_film(film)
      {:ok, %Film{}}

      iex> delete_film(film)
      {:error, %Ecto.Changeset{}}

  """
  def delete_film(%Film{} = film) do
    Repo.delete(film)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking film changes.

  ## Examples

      iex> change_film(film)
      %Ecto.Changeset{data: %Film{}}

  """
  def change_film(%Film{} = film, attrs \\ %{}) do
    Film.changeset(film, attrs)
  end

  alias FilmFlow.Settings.ShutterSpeed

  @doc """
  Returns the list of shutter_speed.

  ## Examples

      iex> list_shutter_speed()
      [%ShutterSpeed{}, ...]

  """
  def list_shutter_speed do
    Repo.all(ShutterSpeed)
  end

  @doc """
  Gets a single shutter_speed.

  Raises `Ecto.NoResultsError` if the Shutter speed does not exist.

  ## Examples

      iex> get_shutter_speed!(123)
      %ShutterSpeed{}

      iex> get_shutter_speed!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shutter_speed!(id), do: Repo.get!(ShutterSpeed, id)

  @doc """
  Creates a shutter_speed.

  ## Examples

      iex> create_shutter_speed(%{field: value})
      {:ok, %ShutterSpeed{}}

      iex> create_shutter_speed(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shutter_speed(attrs \\ %{}) do
    %ShutterSpeed{}
    |> ShutterSpeed.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shutter_speed.

  ## Examples

      iex> update_shutter_speed(shutter_speed, %{field: new_value})
      {:ok, %ShutterSpeed{}}

      iex> update_shutter_speed(shutter_speed, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shutter_speed(%ShutterSpeed{} = shutter_speed, attrs) do
    shutter_speed
    |> ShutterSpeed.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shutter_speed.

  ## Examples

      iex> delete_shutter_speed(shutter_speed)
      {:ok, %ShutterSpeed{}}

      iex> delete_shutter_speed(shutter_speed)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shutter_speed(%ShutterSpeed{} = shutter_speed) do
    Repo.delete(shutter_speed)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shutter_speed changes.

  ## Examples

      iex> change_shutter_speed(shutter_speed)
      %Ecto.Changeset{data: %ShutterSpeed{}}

  """
  def change_shutter_speed(%ShutterSpeed{} = shutter_speed, attrs \\ %{}) do
    ShutterSpeed.changeset(shutter_speed, attrs)
  end

  alias FilmFlow.Settings.Aperture

  @doc """
  Returns the list of aperture.

  ## Examples

      iex> list_aperture()
      [%Aperture{}, ...]

  """
  def list_aperture do
    Repo.all(Aperture)
  end

  @doc """
  Gets a single aperture.

  Raises `Ecto.NoResultsError` if the Aperture does not exist.

  ## Examples

      iex> get_aperture!(123)
      %Aperture{}

      iex> get_aperture!(456)
      ** (Ecto.NoResultsError)

  """
  def get_aperture!(id), do: Repo.get!(Aperture, id)

  @doc """
  Creates a aperture.

  ## Examples

      iex> create_aperture(%{field: value})
      {:ok, %Aperture{}}

      iex> create_aperture(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_aperture(attrs \\ %{}) do
    %Aperture{}
    |> Aperture.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a aperture.

  ## Examples

      iex> update_aperture(aperture, %{field: new_value})
      {:ok, %Aperture{}}

      iex> update_aperture(aperture, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_aperture(%Aperture{} = aperture, attrs) do
    aperture
    |> Aperture.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a aperture.

  ## Examples

      iex> delete_aperture(aperture)
      {:ok, %Aperture{}}

      iex> delete_aperture(aperture)
      {:error, %Ecto.Changeset{}}

  """
  def delete_aperture(%Aperture{} = aperture) do
    Repo.delete(aperture)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking aperture changes.

  ## Examples

      iex> change_aperture(aperture)
      %Ecto.Changeset{data: %Aperture{}}

  """
  def change_aperture(%Aperture{} = aperture, attrs \\ %{}) do
    Aperture.changeset(aperture, attrs)
  end

  alias FilmFlow.Settings.Tripod

  @doc """
  Returns the list of tripods.

  ## Examples

      iex> list_tripods()
      [%Tripod{}, ...]

  """
  def list_tripods do
    Repo.all(Tripod)
  end

  @doc """
  Gets a single tripod.

  Raises `Ecto.NoResultsError` if the Tripod does not exist.

  ## Examples

      iex> get_tripod!(123)
      %Tripod{}

      iex> get_tripod!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tripod!(id), do: Repo.get!(Tripod, id)

  @doc """
  Creates a tripod.

  ## Examples

      iex> create_tripod(%{field: value})
      {:ok, %Tripod{}}

      iex> create_tripod(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tripod(attrs \\ %{}) do
    %Tripod{}
    |> Tripod.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tripod.

  ## Examples

      iex> update_tripod(tripod, %{field: new_value})
      {:ok, %Tripod{}}

      iex> update_tripod(tripod, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tripod(%Tripod{} = tripod, attrs) do
    tripod
    |> Tripod.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tripod.

  ## Examples

      iex> delete_tripod(tripod)
      {:ok, %Tripod{}}

      iex> delete_tripod(tripod)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tripod(%Tripod{} = tripod) do
    Repo.delete(tripod)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tripod changes.

  ## Examples

      iex> change_tripod(tripod)
      %Ecto.Changeset{data: %Tripod{}}

  """
  def change_tripod(%Tripod{} = tripod, attrs \\ %{}) do
    Tripod.changeset(tripod, attrs)
  end

  alias FilmFlow.Settings.Zone

  @doc """
  Returns the list of zones.

  ## Examples

      iex> list_zones()
      [%Zone{}, ...]

  """
  def list_zones do
    Repo.all(Zone)
  end

  @doc """
  Gets a single zone.

  Raises `Ecto.NoResultsError` if the Zone does not exist.

  ## Examples

      iex> get_zone!(123)
      %Zone{}

      iex> get_zone!(456)
      ** (Ecto.NoResultsError)

  """
  def get_zone!(id), do: Repo.get!(Zone, id)

  @doc """
  Creates a zone.

  ## Examples

      iex> create_zone(%{field: value})
      {:ok, %Zone{}}

      iex> create_zone(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_zone(attrs \\ %{}) do
    %Zone{}
    |> Zone.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a zone.

  ## Examples

      iex> update_zone(zone, %{field: new_value})
      {:ok, %Zone{}}

      iex> update_zone(zone, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_zone(%Zone{} = zone, attrs) do
    zone
    |> Zone.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a zone.

  ## Examples

      iex> delete_zone(zone)
      {:ok, %Zone{}}

      iex> delete_zone(zone)
      {:error, %Ecto.Changeset{}}

  """
  def delete_zone(%Zone{} = zone) do
    Repo.delete(zone)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking zone changes.

  ## Examples

      iex> change_zone(zone)
      %Ecto.Changeset{data: %Zone{}}

  """
  def change_zone(%Zone{} = zone, attrs \\ %{}) do
    Zone.changeset(zone, attrs)
  end

  alias FilmFlow.Settings.Photographer

  @doc """
  Returns the list of photographers.

  ## Examples

      iex> list_photographers()
      [%Photographer{}, ...]

  """
  def list_photographers do
    Repo.all(Photographer)
  end

  @doc """
  Gets a single photographer.

  Raises `Ecto.NoResultsError` if the Photographer does not exist.

  ## Examples

      iex> get_photographer!(123)
      %Photographer{}

      iex> get_photographer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_photographer!(id), do: Repo.get!(Photographer, id)

  @doc """
  Creates a photographer.

  ## Examples

      iex> create_photographer(%{field: value})
      {:ok, %Photographer{}}

      iex> create_photographer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_photographer(attrs \\ %{}) do
    %Photographer{}
    |> Photographer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a photographer.

  ## Examples

      iex> update_photographer(photographer, %{field: new_value})
      {:ok, %Photographer{}}

      iex> update_photographer(photographer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_photographer(%Photographer{} = photographer, attrs) do
    photographer
    |> Photographer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a photographer.

  ## Examples

      iex> delete_photographer(photographer)
      {:ok, %Photographer{}}

      iex> delete_photographer(photographer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_photographer(%Photographer{} = photographer) do
    Repo.delete(photographer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking photographer changes.

  ## Examples

      iex> change_photographer(photographer)
      %Ecto.Changeset{data: %Photographer{}}

  """
  def change_photographer(%Photographer{} = photographer, attrs \\ %{}) do
    Photographer.changeset(photographer, attrs)
  end

  alias FilmFlow.Settings.Location

  @doc """
  Returns the list of locations.

  ## Examples

      iex> list_locations()
      [%Location{}, ...]

  """
  def list_locations do
    Repo.all(Location)
  end

  @doc """
  Gets a single location.

  Raises `Ecto.NoResultsError` if the Location does not exist.

  ## Examples

      iex> get_location!(123)
      %Location{}

      iex> get_location!(456)
      ** (Ecto.NoResultsError)

  """
  def get_location!(id), do: Repo.get!(Location, id)

  @doc """
  Creates a location.

  ## Examples

      iex> create_location(%{field: value})
      {:ok, %Location{}}

      iex> create_location(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_location(attrs \\ %{}) do
    %Location{}
    |> Location.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a location.

  ## Examples

      iex> update_location(location, %{field: new_value})
      {:ok, %Location{}}

      iex> update_location(location, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_location(%Location{} = location, attrs) do
    location
    |> Location.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a location.

  ## Examples

      iex> delete_location(location)
      {:ok, %Location{}}

      iex> delete_location(location)
      {:error, %Ecto.Changeset{}}

  """
  def delete_location(%Location{} = location) do
    Repo.delete(location)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking location changes.

  ## Examples

      iex> change_location(location)
      %Ecto.Changeset{data: %Location{}}

  """
  def change_location(%Location{} = location, attrs \\ %{}) do
    Location.changeset(location, attrs)
  end

  alias FilmFlow.Settings.ExposureRecord

  @doc """
  Returns the list of exposure_records.

  ## Examples

      iex> list_exposure_records()
      [%ExposureRecord{}, ...]

  """
  def list_exposure_records do
    Repo.all(ExposureRecord)
  end

  @doc """
  Gets a single exposure_record.

  Raises `Ecto.NoResultsError` if the Exposure record does not exist.

  ## Examples

      iex> get_exposure_record!(123)
      %ExposureRecord{}

      iex> get_exposure_record!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exposure_record!(id), do: Repo.get!(ExposureRecord, id)

  @doc """
  Creates a exposure_record.

  ## Examples

      iex> create_exposure_record(%{field: value})
      {:ok, %ExposureRecord{}}

      iex> create_exposure_record(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exposure_record(attrs \\ %{}) do
    %ExposureRecord{}
    |> ExposureRecord.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exposure_record.

  ## Examples

      iex> update_exposure_record(exposure_record, %{field: new_value})
      {:ok, %ExposureRecord{}}

      iex> update_exposure_record(exposure_record, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exposure_record(%ExposureRecord{} = exposure_record, attrs) do
    exposure_record
    |> ExposureRecord.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a exposure_record.

  ## Examples

      iex> delete_exposure_record(exposure_record)
      {:ok, %ExposureRecord{}}

      iex> delete_exposure_record(exposure_record)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exposure_record(%ExposureRecord{} = exposure_record) do
    Repo.delete(exposure_record)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exposure_record changes.

  ## Examples

      iex> change_exposure_record(exposure_record)
      %Ecto.Changeset{data: %ExposureRecord{}}

  """
  def change_exposure_record(%ExposureRecord{} = exposure_record, attrs \\ %{}) do
    ExposureRecord.changeset(exposure_record, attrs)
  end

  alias FilmFlow.Settings.Filter

  @doc """
  Returns the list of filters.

  ## Examples

      iex> list_filters()
      [%Filter{}, ...]

  """
  def list_filters do
    Repo.all(Filter)
  end

  @doc """
  Gets a single filter.

  Raises `Ecto.NoResultsError` if the Filter does not exist.

  ## Examples

      iex> get_filter!(123)
      %Filter{}

      iex> get_filter!(456)
      ** (Ecto.NoResultsError)

  """
  def get_filter!(id), do: Repo.get!(Filter, id)

  @doc """
  Creates a filter.

  ## Examples

      iex> create_filter(%{field: value})
      {:ok, %Filter{}}

      iex> create_filter(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_filter(attrs \\ %{}) do
    %Filter{}
    |> Filter.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a filter.

  ## Examples

      iex> update_filter(filter, %{field: new_value})
      {:ok, %Filter{}}

      iex> update_filter(filter, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_filter(%Filter{} = filter, attrs) do
    filter
    |> Filter.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a filter.

  ## Examples

      iex> delete_filter(filter)
      {:ok, %Filter{}}

      iex> delete_filter(filter)
      {:error, %Ecto.Changeset{}}

  """
  def delete_filter(%Filter{} = filter) do
    Repo.delete(filter)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking filter changes.

  ## Examples

      iex> change_filter(filter)
      %Ecto.Changeset{data: %Filter{}}

  """
  def change_filter(%Filter{} = filter, attrs \\ %{}) do
    Filter.changeset(filter, attrs)
  end

  alias FilmFlow.Settings.Holder

  @doc """
  Returns the list of holders.

  ## Examples

      iex> list_holders()
      [%Holder{}, ...]

  """
  def list_holders do
    Repo.all(Holder)
  end

  @doc """
  Gets a single holder.

  Raises `Ecto.NoResultsError` if the Holder does not exist.

  ## Examples

      iex> get_holder!(123)
      %Holder{}

      iex> get_holder!(456)
      ** (Ecto.NoResultsError)

  """
  def get_holder!(id), do: Repo.get!(Holder, id)

  @doc """
  Creates a holder.

  ## Examples

      iex> create_holder(%{field: value})
      {:ok, %Holder{}}

      iex> create_holder(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_holder(attrs \\ %{}) do
    %Holder{}
    |> Holder.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a holder.

  ## Examples

      iex> update_holder(holder, %{field: new_value})
      {:ok, %Holder{}}

      iex> update_holder(holder, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_holder(%Holder{} = holder, attrs) do
    holder
    |> Holder.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a holder.

  ## Examples

      iex> delete_holder(holder)
      {:ok, %Holder{}}

      iex> delete_holder(holder)
      {:error, %Ecto.Changeset{}}

  """
  def delete_holder(%Holder{} = holder) do
    Repo.delete(holder)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking holder changes.

  ## Examples

      iex> change_holder(holder)
      %Ecto.Changeset{data: %Holder{}}

  """
  def change_holder(%Holder{} = holder, attrs \\ %{}) do
    Holder.changeset(holder, attrs)
  end

  alias FilmFlow.Settings.FilmBack

  @doc """
  Returns the list of film_backs.

  ## Examples

      iex> list_film_backs()
      [%FilmBack{}, ...]

  """
  def list_film_backs do
    Repo.all(FilmBack)
  end

  @doc """
  Gets a single film_back.

  Raises `Ecto.NoResultsError` if the Film back does not exist.

  ## Examples

      iex> get_film_back!(123)
      %FilmBack{}

      iex> get_film_back!(456)
      ** (Ecto.NoResultsError)

  """
  def get_film_back!(id), do: Repo.get!(FilmBack, id)

  @doc """
  Creates a film_back.

  ## Examples

      iex> create_film_back(%{field: value})
      {:ok, %FilmBack{}}

      iex> create_film_back(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_film_back(attrs \\ %{}) do
    %FilmBack{}
    |> FilmBack.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a film_back.

  ## Examples

      iex> update_film_back(film_back, %{field: new_value})
      {:ok, %FilmBack{}}

      iex> update_film_back(film_back, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_film_back(%FilmBack{} = film_back, attrs) do
    film_back
    |> FilmBack.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a film_back.

  ## Examples

      iex> delete_film_back(film_back)
      {:ok, %FilmBack{}}

      iex> delete_film_back(film_back)
      {:error, %Ecto.Changeset{}}

  """
  def delete_film_back(%FilmBack{} = film_back) do
    Repo.delete(film_back)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking film_back changes.

  ## Examples

      iex> change_film_back(film_back)
      %Ecto.Changeset{data: %FilmBack{}}

  """
  def change_film_back(%FilmBack{} = film_back, attrs \\ %{}) do
    FilmBack.changeset(film_back, attrs)
  end

  alias FilmFlow.Settings.LightCondition

  @doc """
  Returns the list of light_conditions.

  ## Examples

      iex> list_light_conditions()
      [%LightCondition{}, ...]

  """
  def list_light_conditions do
    Repo.all(LightCondition)
  end

  @doc """
  Gets a single light_condition.

  Raises `Ecto.NoResultsError` if the Light condition does not exist.

  ## Examples

      iex> get_light_condition!(123)
      %LightCondition{}

      iex> get_light_condition!(456)
      ** (Ecto.NoResultsError)

  """
  def get_light_condition!(id), do: Repo.get!(LightCondition, id)

  @doc """
  Creates a light_condition.

  ## Examples

      iex> create_light_condition(%{field: value})
      {:ok, %LightCondition{}}

      iex> create_light_condition(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_light_condition(attrs \\ %{}) do
    %LightCondition{}
    |> LightCondition.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a light_condition.

  ## Examples

      iex> update_light_condition(light_condition, %{field: new_value})
      {:ok, %LightCondition{}}

      iex> update_light_condition(light_condition, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_light_condition(%LightCondition{} = light_condition, attrs) do
    light_condition
    |> LightCondition.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a light_condition.

  ## Examples

      iex> delete_light_condition(light_condition)
      {:ok, %LightCondition{}}

      iex> delete_light_condition(light_condition)
      {:error, %Ecto.Changeset{}}

  """
  def delete_light_condition(%LightCondition{} = light_condition) do
    Repo.delete(light_condition)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking light_condition changes.

  ## Examples

      iex> change_light_condition(light_condition)
      %Ecto.Changeset{data: %LightCondition{}}

  """
  def change_light_condition(%LightCondition{} = light_condition, attrs \\ %{}) do
    LightCondition.changeset(light_condition, attrs)
  end
end
