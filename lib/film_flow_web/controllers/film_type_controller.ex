defmodule FilmFlowWeb.FilmTypeController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.FilmType

  def index(conn, _params) do
    film_type = Settings.list_film_type()
    render(conn, :index, film_type_collection: film_type)
  end

  def new(conn, _params) do
    changeset = Settings.change_film_type(%FilmType{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"film_type" => film_type_params}) do
    case Settings.create_film_type(film_type_params) do
      {:ok, film_type} ->
        conn
        |> put_flash(:info, "Film type created successfully.")
        |> redirect(to: ~p"/film_type/#{film_type}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    film_type = Settings.get_film_type!(id)
    render(conn, :show, film_type: film_type)
  end

  def edit(conn, %{"id" => id}) do
    film_type = Settings.get_film_type!(id)
    changeset = Settings.change_film_type(film_type)
    render(conn, :edit, film_type: film_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "film_type" => film_type_params}) do
    film_type = Settings.get_film_type!(id)

    case Settings.update_film_type(film_type, film_type_params) do
      {:ok, film_type} ->
        conn
        |> put_flash(:info, "Film type updated successfully.")
        |> redirect(to: ~p"/film_type/#{film_type}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, film_type: film_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    film_type = Settings.get_film_type!(id)
    {:ok, _film_type} = Settings.delete_film_type(film_type)

    conn
    |> put_flash(:info, "Film type deleted successfully.")
    |> redirect(to: ~p"/film_type")
  end
end
