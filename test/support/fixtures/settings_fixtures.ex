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
end
