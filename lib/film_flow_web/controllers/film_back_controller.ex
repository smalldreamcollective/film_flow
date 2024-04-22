defmodule FilmFlowWeb.FilmBackController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.FilmBack

  def index(conn, _params) do
    film_backs = Settings.list_film_backs()
    render(conn, :index, film_backs: film_backs)
  end

  def new(conn, _params) do
    changeset = Settings.change_film_back(%FilmBack{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"film_back" => film_back_params}) do
    case Settings.create_film_back(film_back_params) do
      {:ok, film_back} ->
        conn
        |> put_flash(:info, "Film back created successfully.")
        |> redirect(to: ~p"/film_backs/#{film_back}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    film_back = Settings.get_film_back!(id)
    render(conn, :show, film_back: film_back)
  end

  def edit(conn, %{"id" => id}) do
    film_back = Settings.get_film_back!(id)
    changeset = Settings.change_film_back(film_back)
    render(conn, :edit, film_back: film_back, changeset: changeset)
  end

  def update(conn, %{"id" => id, "film_back" => film_back_params}) do
    film_back = Settings.get_film_back!(id)

    case Settings.update_film_back(film_back, film_back_params) do
      {:ok, film_back} ->
        conn
        |> put_flash(:info, "Film back updated successfully.")
        |> redirect(to: ~p"/film_backs/#{film_back}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, film_back: film_back, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    film_back = Settings.get_film_back!(id)
    {:ok, _film_back} = Settings.delete_film_back(film_back)

    conn
    |> put_flash(:info, "Film back deleted successfully.")
    |> redirect(to: ~p"/film_backs")
  end
end
