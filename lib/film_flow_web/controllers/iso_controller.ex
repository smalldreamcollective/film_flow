defmodule FilmFlowWeb.ISOController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.ISO

  def index(conn, _params) do
    iso = Settings.list_iso()
    render(conn, :index, iso_collection: iso)
  end

  def new(conn, _params) do
    changeset = Settings.change_iso(%ISO{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"iso" => iso_params}) do
    case Settings.create_iso(iso_params) do
      {:ok, iso} ->
        conn
        |> put_flash(:info, "Iso created successfully.")
        |> redirect(to: ~p"/iso/#{iso}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    iso = Settings.get_iso!(id)
    render(conn, :show, iso: iso)
  end

  def edit(conn, %{"id" => id}) do
    iso = Settings.get_iso!(id)
    changeset = Settings.change_iso(iso)
    render(conn, :edit, iso: iso, changeset: changeset)
  end

  def update(conn, %{"id" => id, "iso" => iso_params}) do
    iso = Settings.get_iso!(id)

    case Settings.update_iso(iso, iso_params) do
      {:ok, iso} ->
        conn
        |> put_flash(:info, "Iso updated successfully.")
        |> redirect(to: ~p"/iso/#{iso}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, iso: iso, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    iso = Settings.get_iso!(id)
    {:ok, _iso} = Settings.delete_iso(iso)

    conn
    |> put_flash(:info, "Iso deleted successfully.")
    |> redirect(to: ~p"/iso")
  end
end
