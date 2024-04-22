defmodule FilmFlowWeb.FilmController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.Film

  def index(conn, _params) do
    film = Settings.list_film()
    render(conn, :index, film_collection: film)
  end

  def new(conn, _params) do
    changeset = Settings.change_film(%Film{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"film" => film_params}) do
    case Settings.create_film(film_params) do
      {:ok, film} ->
        conn
        |> put_flash(:info, "Film created successfully.")
        |> redirect(to: ~p"/film/#{film}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    film = Settings.get_film!(id)
    render(conn, :show, film: film)
  end

  def edit(conn, %{"id" => id}) do
    film = Settings.get_film!(id)
    changeset = Settings.change_film(film)
    render(conn, :edit, film: film, changeset: changeset)
  end

  def update(conn, %{"id" => id, "film" => film_params}) do
    film = Settings.get_film!(id)

    case Settings.update_film(film, film_params) do
      {:ok, film} ->
        conn
        |> put_flash(:info, "Film updated successfully.")
        |> redirect(to: ~p"/film/#{film}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, film: film, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    film = Settings.get_film!(id)
    {:ok, _film} = Settings.delete_film(film)

    conn
    |> put_flash(:info, "Film deleted successfully.")
    |> redirect(to: ~p"/film")
  end
end
