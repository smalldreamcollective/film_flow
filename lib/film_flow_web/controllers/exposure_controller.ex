defmodule FilmFlowWeb.ExposureController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.Exposure

  def index(conn, _params) do
    exposures = Settings.list_exposures()
    render(conn, :index, exposures: exposures)
  end

  def new(conn, _params) do
    changeset = Settings.change_exposure(%Exposure{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"exposure" => exposure_params}) do
    case Settings.create_exposure(exposure_params) do
      {:ok, exposure} ->
        conn
        |> put_flash(:info, "Exposure created successfully.")
        |> redirect(to: ~p"/exposures/#{exposure}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    exposure = Settings.get_exposure!(id)
    render(conn, :show, exposure: exposure)
  end

  def edit(conn, %{"id" => id}) do
    exposure = Settings.get_exposure!(id)
    changeset = Settings.change_exposure(exposure)
    render(conn, :edit, exposure: exposure, changeset: changeset)
  end

  def update(conn, %{"id" => id, "exposure" => exposure_params}) do
    exposure = Settings.get_exposure!(id)

    case Settings.update_exposure(exposure, exposure_params) do
      {:ok, exposure} ->
        conn
        |> put_flash(:info, "Exposure updated successfully.")
        |> redirect(to: ~p"/exposures/#{exposure}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, exposure: exposure, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    exposure = Settings.get_exposure!(id)
    {:ok, _exposure} = Settings.delete_exposure(exposure)

    conn
    |> put_flash(:info, "Exposure deleted successfully.")
    |> redirect(to: ~p"/exposures")
  end
end
