defmodule FilmFlowWeb.FilterController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.Filter

  def index(conn, _params) do
    filters = Settings.list_filters()
    render(conn, :index, filters: filters)
  end

  def new(conn, _params) do
    changeset = Settings.change_filter(%Filter{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"filter" => filter_params}) do
    case Settings.create_filter(filter_params) do
      {:ok, filter} ->
        conn
        |> put_flash(:info, "Filter created successfully.")
        |> redirect(to: ~p"/filters/#{filter}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    filter = Settings.get_filter!(id)
    render(conn, :show, filter: filter)
  end

  def edit(conn, %{"id" => id}) do
    filter = Settings.get_filter!(id)
    changeset = Settings.change_filter(filter)
    render(conn, :edit, filter: filter, changeset: changeset)
  end

  def update(conn, %{"id" => id, "filter" => filter_params}) do
    filter = Settings.get_filter!(id)

    case Settings.update_filter(filter, filter_params) do
      {:ok, filter} ->
        conn
        |> put_flash(:info, "Filter updated successfully.")
        |> redirect(to: ~p"/filters/#{filter}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, filter: filter, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    filter = Settings.get_filter!(id)
    {:ok, _filter} = Settings.delete_filter(filter)

    conn
    |> put_flash(:info, "Filter deleted successfully.")
    |> redirect(to: ~p"/filters")
  end
end
