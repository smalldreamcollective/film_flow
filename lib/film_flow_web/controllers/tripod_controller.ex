defmodule FilmFlowWeb.TripodController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.Tripod

  def index(conn, _params) do
    tripods = Settings.list_tripods()
    render(conn, :index, tripods: tripods)
  end

  def new(conn, _params) do
    changeset = Settings.change_tripod(%Tripod{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"tripod" => tripod_params}) do
    case Settings.create_tripod(tripod_params) do
      {:ok, tripod} ->
        conn
        |> put_flash(:info, "Tripod created successfully.")
        |> redirect(to: ~p"/tripods/#{tripod}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tripod = Settings.get_tripod!(id)
    render(conn, :show, tripod: tripod)
  end

  def edit(conn, %{"id" => id}) do
    tripod = Settings.get_tripod!(id)
    changeset = Settings.change_tripod(tripod)
    render(conn, :edit, tripod: tripod, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tripod" => tripod_params}) do
    tripod = Settings.get_tripod!(id)

    case Settings.update_tripod(tripod, tripod_params) do
      {:ok, tripod} ->
        conn
        |> put_flash(:info, "Tripod updated successfully.")
        |> redirect(to: ~p"/tripods/#{tripod}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, tripod: tripod, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tripod = Settings.get_tripod!(id)
    {:ok, _tripod} = Settings.delete_tripod(tripod)

    conn
    |> put_flash(:info, "Tripod deleted successfully.")
    |> redirect(to: ~p"/tripods")
  end
end
