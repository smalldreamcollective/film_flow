defmodule FilmFlowWeb.ApertureController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.Aperture

  def index(conn, _params) do
    aperture = Settings.list_aperture()
    render(conn, :index, aperture_collection: aperture)
  end

  def new(conn, _params) do
    changeset = Settings.change_aperture(%Aperture{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"aperture" => aperture_params}) do
    case Settings.create_aperture(aperture_params) do
      {:ok, aperture} ->
        conn
        |> put_flash(:info, "Aperture created successfully.")
        |> redirect(to: ~p"/aperture/#{aperture}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    aperture = Settings.get_aperture!(id)
    render(conn, :show, aperture: aperture)
  end

  def edit(conn, %{"id" => id}) do
    aperture = Settings.get_aperture!(id)
    changeset = Settings.change_aperture(aperture)
    render(conn, :edit, aperture: aperture, changeset: changeset)
  end

  def update(conn, %{"id" => id, "aperture" => aperture_params}) do
    aperture = Settings.get_aperture!(id)

    case Settings.update_aperture(aperture, aperture_params) do
      {:ok, aperture} ->
        conn
        |> put_flash(:info, "Aperture updated successfully.")
        |> redirect(to: ~p"/aperture/#{aperture}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, aperture: aperture, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    aperture = Settings.get_aperture!(id)
    {:ok, _aperture} = Settings.delete_aperture(aperture)

    conn
    |> put_flash(:info, "Aperture deleted successfully.")
    |> redirect(to: ~p"/aperture")
  end
end
