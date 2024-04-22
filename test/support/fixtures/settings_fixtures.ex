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
    {:ok, lens} =
      attrs
      |> Enum.into(%{
        description: "some description",
        model: "some model",
        url_additional_info: "some url_additional_info",
        url_manual: "some url_manual",
        years: "some years"
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
end
