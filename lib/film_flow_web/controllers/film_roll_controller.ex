defmodule FilmFlowWeb.FilmRollController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.FilmRoll

  def index(conn, _params) do
    film_rolls = Settings.list_film_rolls()
    render(conn, :index, film_rolls: film_rolls)
  end

  def new(conn, _params) do
    changeset = Settings.change_film_roll(%FilmRoll{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"film_roll" => film_roll_params}) do
    case Settings.create_film_roll(film_roll_params) do
      {:ok, film_roll} ->
        conn
        |> put_flash(:info, "Film roll created successfully.")
        |> redirect(to: ~p"/film_rolls/#{film_roll}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    film_roll = Settings.get_film_roll!(id)
    render(conn, :show, film_roll: film_roll)
  end

  def edit(conn, %{"id" => id}) do
    film_roll = Settings.get_film_roll!(id)
    changeset = Settings.change_film_roll(film_roll)
    render(conn, :edit, film_roll: film_roll, changeset: changeset)
  end

  def update(conn, %{"id" => id, "film_roll" => film_roll_params}) do
    film_roll = Settings.get_film_roll!(id)

    case Settings.update_film_roll(film_roll, film_roll_params) do
      {:ok, film_roll} ->
        conn
        |> put_flash(:info, "Film roll updated successfully.")
        |> redirect(to: ~p"/film_rolls/#{film_roll}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, film_roll: film_roll, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    film_roll = Settings.get_film_roll!(id)
    {:ok, _film_roll} = Settings.delete_film_roll(film_roll)

    conn
    |> put_flash(:info, "Film roll deleted successfully.")
    |> redirect(to: ~p"/film_rolls")
  end
end
