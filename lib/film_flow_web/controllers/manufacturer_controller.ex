defmodule FilmFlowWeb.ManufacturerController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.Manufacturer

  def index(conn, _params) do
    manufacturers = Settings.list_manufacturers()
    render(conn, :index, manufacturers: manufacturers)
  end

  def new(conn, _params) do
    changeset = Settings.change_manufacturer(%Manufacturer{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"manufacturer" => manufacturer_params}) do
    case Settings.create_manufacturer(manufacturer_params) do
      {:ok, manufacturer} ->
        conn
        |> put_flash(:info, "Manufacturer created successfully.")
        |> redirect(to: ~p"/manufacturers/#{manufacturer}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    manufacturer = Settings.get_manufacturer!(id)
    render(conn, :show, manufacturer: manufacturer)
  end

  def edit(conn, %{"id" => id}) do
    manufacturer = Settings.get_manufacturer!(id)
    changeset = Settings.change_manufacturer(manufacturer)
    render(conn, :edit, manufacturer: manufacturer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "manufacturer" => manufacturer_params}) do
    manufacturer = Settings.get_manufacturer!(id)

    case Settings.update_manufacturer(manufacturer, manufacturer_params) do
      {:ok, manufacturer} ->
        conn
        |> put_flash(:info, "Manufacturer updated successfully.")
        |> redirect(to: ~p"/manufacturers/#{manufacturer}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, manufacturer: manufacturer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    manufacturer = Settings.get_manufacturer!(id)
    {:ok, _manufacturer} = Settings.delete_manufacturer(manufacturer)

    conn
    |> put_flash(:info, "Manufacturer deleted successfully.")
    |> redirect(to: ~p"/manufacturers")
  end
end
