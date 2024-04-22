defmodule FilmFlowWeb.FormatController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.Format

  def index(conn, _params) do
    format = Settings.list_format()
    render(conn, :index, format_collection: format)
  end

  def new(conn, _params) do
    changeset = Settings.change_format(%Format{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"format" => format_params}) do
    case Settings.create_format(format_params) do
      {:ok, format} ->
        conn
        |> put_flash(:info, "Format created successfully.")
        |> redirect(to: ~p"/format/#{format}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    format = Settings.get_format!(id)
    render(conn, :show, format: format)
  end

  def edit(conn, %{"id" => id}) do
    format = Settings.get_format!(id)
    changeset = Settings.change_format(format)
    render(conn, :edit, format: format, changeset: changeset)
  end

  def update(conn, %{"id" => id, "format" => format_params}) do
    format = Settings.get_format!(id)

    case Settings.update_format(format, format_params) do
      {:ok, format} ->
        conn
        |> put_flash(:info, "Format updated successfully.")
        |> redirect(to: ~p"/format/#{format}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, format: format, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    format = Settings.get_format!(id)
    {:ok, _format} = Settings.delete_format(format)

    conn
    |> put_flash(:info, "Format deleted successfully.")
    |> redirect(to: ~p"/format")
  end
end
