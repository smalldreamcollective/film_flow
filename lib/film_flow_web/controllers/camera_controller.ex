defmodule FilmFlowWeb.CameraController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.Camera

  def index(conn, _params) do
    cameras = Settings.list_cameras()
    render(conn, :index, cameras: cameras)
  end

  def new(conn, _params) do
    changeset = Settings.change_camera(%Camera{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"camera" => camera_params}) do
    case Settings.create_camera(camera_params) do
      {:ok, camera} ->
        conn
        |> put_flash(:info, "Camera created successfully.")
        |> redirect(to: ~p"/cameras/#{camera}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    camera = Settings.get_camera!(id)
    render(conn, :show, camera: camera)
  end

  def edit(conn, %{"id" => id}) do
    camera = Settings.get_camera!(id)
    changeset = Settings.change_camera(camera)
    render(conn, :edit, camera: camera, changeset: changeset)
  end

  def update(conn, %{"id" => id, "camera" => camera_params}) do
    camera = Settings.get_camera!(id)

    case Settings.update_camera(camera, camera_params) do
      {:ok, camera} ->
        conn
        |> put_flash(:info, "Camera updated successfully.")
        |> redirect(to: ~p"/cameras/#{camera}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, camera: camera, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    camera = Settings.get_camera!(id)
    {:ok, _camera} = Settings.delete_camera(camera)

    conn
    |> put_flash(:info, "Camera deleted successfully.")
    |> redirect(to: ~p"/cameras")
  end
end
