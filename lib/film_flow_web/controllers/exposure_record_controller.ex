defmodule FilmFlowWeb.ExposureRecordController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.ExposureRecord

  def index(conn, _params) do
    exposure_records = Settings.list_exposure_records()
    render(conn, :index, exposure_records: exposure_records)
  end

  def new(conn, _params) do
    changeset = Settings.change_exposure_record(%ExposureRecord{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"exposure_record" => exposure_record_params}) do
    case Settings.create_exposure_record(exposure_record_params) do
      {:ok, exposure_record} ->
        conn
        |> put_flash(:info, "Exposure record created successfully.")
        |> redirect(to: ~p"/exposure_records/#{exposure_record}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    exposure_record = Settings.get_exposure_record!(id)
    render(conn, :show, exposure_record: exposure_record)
  end

  def edit(conn, %{"id" => id}) do
    exposure_record = Settings.get_exposure_record!(id)
    changeset = Settings.change_exposure_record(exposure_record)
    render(conn, :edit, exposure_record: exposure_record, changeset: changeset)
  end

  def update(conn, %{"id" => id, "exposure_record" => exposure_record_params}) do
    exposure_record = Settings.get_exposure_record!(id)

    case Settings.update_exposure_record(exposure_record, exposure_record_params) do
      {:ok, exposure_record} ->
        conn
        |> put_flash(:info, "Exposure record updated successfully.")
        |> redirect(to: ~p"/exposure_records/#{exposure_record}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, exposure_record: exposure_record, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    exposure_record = Settings.get_exposure_record!(id)
    {:ok, _exposure_record} = Settings.delete_exposure_record(exposure_record)

    conn
    |> put_flash(:info, "Exposure record deleted successfully.")
    |> redirect(to: ~p"/exposure_records")
  end
end
