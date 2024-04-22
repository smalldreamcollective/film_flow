defmodule FilmFlowWeb.PhotographerController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.Photographer

  def index(conn, _params) do
    photographers = Settings.list_photographers()
    render(conn, :index, photographers: photographers)
  end

  def new(conn, _params) do
    changeset = Settings.change_photographer(%Photographer{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"photographer" => photographer_params}) do
    case Settings.create_photographer(photographer_params) do
      {:ok, photographer} ->
        conn
        |> put_flash(:info, "Photographer created successfully.")
        |> redirect(to: ~p"/photographers/#{photographer}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    photographer = Settings.get_photographer!(id)
    render(conn, :show, photographer: photographer)
  end

  def edit(conn, %{"id" => id}) do
    photographer = Settings.get_photographer!(id)
    changeset = Settings.change_photographer(photographer)
    render(conn, :edit, photographer: photographer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "photographer" => photographer_params}) do
    photographer = Settings.get_photographer!(id)

    case Settings.update_photographer(photographer, photographer_params) do
      {:ok, photographer} ->
        conn
        |> put_flash(:info, "Photographer updated successfully.")
        |> redirect(to: ~p"/photographers/#{photographer}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, photographer: photographer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    photographer = Settings.get_photographer!(id)
    {:ok, _photographer} = Settings.delete_photographer(photographer)

    conn
    |> put_flash(:info, "Photographer deleted successfully.")
    |> redirect(to: ~p"/photographers")
  end
end
