defmodule FilmFlowWeb.ZoneController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.Zone

  def index(conn, _params) do
    zones = Settings.list_zones()
    render(conn, :index, zones: zones)
  end

  def new(conn, _params) do
    changeset = Settings.change_zone(%Zone{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"zone" => zone_params}) do
    case Settings.create_zone(zone_params) do
      {:ok, zone} ->
        conn
        |> put_flash(:info, "Zone created successfully.")
        |> redirect(to: ~p"/zones/#{zone}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    zone = Settings.get_zone!(id)
    render(conn, :show, zone: zone)
  end

  def edit(conn, %{"id" => id}) do
    zone = Settings.get_zone!(id)
    changeset = Settings.change_zone(zone)
    render(conn, :edit, zone: zone, changeset: changeset)
  end

  def update(conn, %{"id" => id, "zone" => zone_params}) do
    zone = Settings.get_zone!(id)

    case Settings.update_zone(zone, zone_params) do
      {:ok, zone} ->
        conn
        |> put_flash(:info, "Zone updated successfully.")
        |> redirect(to: ~p"/zones/#{zone}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, zone: zone, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    zone = Settings.get_zone!(id)
    {:ok, _zone} = Settings.delete_zone(zone)

    conn
    |> put_flash(:info, "Zone deleted successfully.")
    |> redirect(to: ~p"/zones")
  end
end
