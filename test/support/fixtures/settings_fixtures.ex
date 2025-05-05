defmodule FilmFlow.SettingsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FilmFlow.Settings` context.
  """

  @doc """
  Generate a camera.
  """
  def camera_fixture(attrs \\ %{}) do
    {:ok, camera} =
      attrs
      |> Enum.into(%{
        brand: "some brand",
        model: "some model",
        name: "some name"
      })
      |> FilmFlow.Settings.create_camera()

    camera
  end

  @doc """
  Generate a manufacturer.
  """
  def manufacturer_fixture(attrs \\ %{}) do
    {:ok, manufacturer} =
      attrs
      |> Enum.into(%{
        name: "some name",
        url: "some url"
      })
      |> FilmFlow.Settings.create_manufacturer()

    manufacturer
  end

  @doc """
  Generate a lens.
  """
  def lens_fixture(attrs \\ %{}) do
    manufacturer = manufacturer_fixture()

    {:ok, lens} =
      attrs
      |> Enum.into(%{
        description: "some description",
        model: "some model",
        url_additional_info: "some url_additional_info",
        url_manual: "some url_manual",
        years: "some years",
        manufacturer_id: manufacturer.id
      })
      |> FilmFlow.Settings.create_lens()

    lens
  end

  @doc """
  Generate a format.
  """
  def format_fixture(attrs \\ %{}) do
    {:ok, format} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> FilmFlow.Settings.create_format()

    format
  end

  @doc """
  Generate a iso.
  """
  def iso_fixture(attrs \\ %{}) do
    {:ok, iso} =
      attrs
      |> Enum.into(%{
        description: "some description",
        value: "some value"
      })
      |> FilmFlow.Settings.create_iso()

    iso
  end

  @doc """
  Generate a film_type.
  """
  def film_type_fixture(attrs \\ %{}) do
    {:ok, film_type} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> FilmFlow.Settings.create_film_type()

    film_type
  end

  @doc """
  Generate a film.
  """
  def film_fixture(attrs \\ %{}) do
    {:ok, film} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> FilmFlow.Settings.create_film()

    film
  end

  @doc """
  Generate a shutter_speed.
  """
  def shutter_speed_fixture(attrs \\ %{}) do
    {:ok, shutter_speed} =
      attrs
      |> Enum.into(%{
        value: "some value"
      })
      |> FilmFlow.Settings.create_shutter_speed()

    shutter_speed
  end

  @doc """
  Generate a aperture.
  """
  def aperture_fixture(attrs \\ %{}) do
    {:ok, aperture} =
      attrs
      |> Enum.into(%{
        value: "some value"
      })
      |> FilmFlow.Settings.create_aperture()

    aperture
  end

  @doc """
  Generate a tripod.
  """
  def tripod_fixture(attrs \\ %{}) do
    {:ok, tripod} =
      attrs
      |> Enum.into(%{
        description: "some description",
        model: "some model",
        url_addtional_info: "some url_addtional_info",
        url_manual: "some url_manual",
        years: "some years"
      })
      |> FilmFlow.Settings.create_tripod()

    tripod
  end

  @doc """
  Generate a zone.
  """
  def zone_fixture(attrs \\ %{}) do
    {:ok, zone} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> FilmFlow.Settings.create_zone()

    zone
  end

  @doc """
  Generate a photographer.
  """
  def photographer_fixture(attrs \\ %{}) do
    {:ok, photographer} =
      attrs
      |> Enum.into(%{
        first_name: "some first_name",
        last_name: "some last_name",
        middle_name: "some middle_name"
      })
      |> FilmFlow.Settings.create_photographer()

    photographer
  end

  @doc """
  Generate a location.
  """
  def location_fixture(attrs \\ %{}) do
    {:ok, location} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> FilmFlow.Settings.create_location()

    location
  end

  @doc """
  Generate a exposure_record.
  """
  def exposure_record_fixture(attrs \\ %{}) do
    {:ok, exposure_record} =
      attrs
      |> Enum.into(%{
        concept: "some concept",
        date_exposed: ~U[2024-04-21 21:57:00Z],
        date_loaded: ~U[2024-04-21 21:57:00Z],
        project_name: "some project_name",
        reference_id: "some reference_id"
      })
      |> FilmFlow.Settings.create_exposure_record()

    exposure_record
  end

  @doc """
  Generate a filter.
  """
  def filter_fixture(attrs \\ %{}) do
    {:ok, filter} =
      attrs
      |> Enum.into(%{
        description: "some description",
        model: "some model",
        url_additional_info: "some url_additional_info",
        url_manual: "some url_manual",
        years: "some years"
      })
      |> FilmFlow.Settings.create_filter()

    filter
  end

  @doc """
  Generate a holder.
  """
  def holder_fixture(attrs \\ %{}) do
    {:ok, holder} =
      attrs
      |> Enum.into(%{
        description: "some description",
        model: "some model",
        url_additional_info: "some url_additional_info",
        url_manual: "some url_manual",
        years: "some years"
      })
      |> FilmFlow.Settings.create_holder()

    holder
  end

  @doc """
  Generate a film_back.
  """
  def film_back_fixture(attrs \\ %{}) do
    {:ok, film_back} =
      attrs
      |> Enum.into(%{
        description: "some description",
        model: "some model",
        url_additional_info: "some url_additional_info",
        url_manual: "some url_manual",
        years: "some years"
      })
      |> FilmFlow.Settings.create_film_back()

    film_back
  end

  @doc """
  Generate a light_condition.
  """
  def light_condition_fixture(attrs \\ %{}) do
    {:ok, light_condition} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        url_icon: "some url_icon"
      })
      |> FilmFlow.Settings.create_light_condition()

    light_condition
  end

  @doc """
  Generate a film_roll.
  """
  def film_roll_fixture(attrs \\ %{}) do
    {:ok, film_roll} =
      attrs
      |> Enum.into(%{
        description: "some description",
        expirate_date: ~U[2024-04-21 22:45:00Z],
        frames: 42,
        name: "some name",
        reference_id: "some reference_id"
      })
      |> FilmFlow.Settings.create_film_roll()

    film_roll
  end

  @doc """
  Generate a exposure.
  """
  def exposure_fixture(attrs \\ %{}) do
    {:ok, exposure} =
      attrs
      |> Enum.into(%{
        date_exposed: ~U[2024-04-21 23:00:00Z],
        frame: 42,
        lighting_condition: "some lighting_condition",
        notes: "some notes",
        subject: "some subject"
      })
      |> FilmFlow.Settings.create_exposure()

    exposure
  end
end
