defmodule FilmFlowWeb.ShutterSpeedController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.ShutterSpeed

  def index(conn, _params) do
    shutter_speed = Settings.list_shutter_speed()
    render(conn, :index, shutter_speed_collection: shutter_speed)
  end

  def new(conn, _params) do
    changeset = Settings.change_shutter_speed(%ShutterSpeed{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"shutter_speed" => shutter_speed_params}) do
    case Settings.create_shutter_speed(shutter_speed_params) do
      {:ok, shutter_speed} ->
        conn
        |> put_flash(:info, "Shutter speed created successfully.")
        |> redirect(to: ~p"/shutter_speed/#{shutter_speed}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    shutter_speed = Settings.get_shutter_speed!(id)
    render(conn, :show, shutter_speed: shutter_speed)
  end

  def edit(conn, %{"id" => id}) do
    shutter_speed = Settings.get_shutter_speed!(id)
    changeset = Settings.change_shutter_speed(shutter_speed)
    render(conn, :edit, shutter_speed: shutter_speed, changeset: changeset)
  end

  def update(conn, %{"id" => id, "shutter_speed" => shutter_speed_params}) do
    shutter_speed = Settings.get_shutter_speed!(id)

    case Settings.update_shutter_speed(shutter_speed, shutter_speed_params) do
      {:ok, shutter_speed} ->
        conn
        |> put_flash(:info, "Shutter speed updated successfully.")
        |> redirect(to: ~p"/shutter_speed/#{shutter_speed}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, shutter_speed: shutter_speed, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    shutter_speed = Settings.get_shutter_speed!(id)
    {:ok, _shutter_speed} = Settings.delete_shutter_speed(shutter_speed)

    conn
    |> put_flash(:info, "Shutter speed deleted successfully.")
    |> redirect(to: ~p"/shutter_speed")
  end
end
