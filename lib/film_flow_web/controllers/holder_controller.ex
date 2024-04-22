defmodule FilmFlowWeb.HolderController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.Holder

  def index(conn, _params) do
    holders = Settings.list_holders()
    render(conn, :index, holders: holders)
  end

  def new(conn, _params) do
    changeset = Settings.change_holder(%Holder{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"holder" => holder_params}) do
    case Settings.create_holder(holder_params) do
      {:ok, holder} ->
        conn
        |> put_flash(:info, "Holder created successfully.")
        |> redirect(to: ~p"/holders/#{holder}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    holder = Settings.get_holder!(id)
    render(conn, :show, holder: holder)
  end

  def edit(conn, %{"id" => id}) do
    holder = Settings.get_holder!(id)
    changeset = Settings.change_holder(holder)
    render(conn, :edit, holder: holder, changeset: changeset)
  end

  def update(conn, %{"id" => id, "holder" => holder_params}) do
    holder = Settings.get_holder!(id)

    case Settings.update_holder(holder, holder_params) do
      {:ok, holder} ->
        conn
        |> put_flash(:info, "Holder updated successfully.")
        |> redirect(to: ~p"/holders/#{holder}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, holder: holder, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    holder = Settings.get_holder!(id)
    {:ok, _holder} = Settings.delete_holder(holder)

    conn
    |> put_flash(:info, "Holder deleted successfully.")
    |> redirect(to: ~p"/holders")
  end
end
