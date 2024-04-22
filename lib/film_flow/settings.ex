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
end
