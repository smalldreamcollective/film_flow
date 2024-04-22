defmodule FilmFlowWeb.LocationController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.Location

  def index(conn, _params) do
    locations = Settings.list_locations()
    render(conn, :index, locations: locations)
  end

  def new(conn, _params) do
    changeset = Settings.change_location(%Location{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"location" => location_params}) do
    case Settings.create_location(location_params) do
      {:ok, location} ->
        conn
        |> put_flash(:info, "Location created successfully.")
        |> redirect(to: ~p"/locations/#{location}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    location = Settings.get_location!(id)
    render(conn, :show, location: location)
  end

  def edit(conn, %{"id" => id}) do
    location = Settings.get_location!(id)
    changeset = Settings.change_location(location)
    render(conn, :edit, location: location, changeset: changeset)
  end

  def update(conn, %{"id" => id, "location" => location_params}) do
    location = Settings.get_location!(id)

    case Settings.update_location(location, location_params) do
      {:ok, location} ->
        conn
        |> put_flash(:info, "Location updated successfully.")
        |> redirect(to: ~p"/locations/#{location}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, location: location, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    location = Settings.get_location!(id)
    {:ok, _location} = Settings.delete_location(location)

    conn
    |> put_flash(:info, "Location deleted successfully.")
    |> redirect(to: ~p"/locations")
  end
end
