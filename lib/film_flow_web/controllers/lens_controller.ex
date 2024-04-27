defmodule FilmFlowWeb.LensController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.Lens

  def index(conn, _params) do
    lenses = Settings.list_lenses()
    manufacturers = Settings.list_manufacturers() |> Enum.map(&{&1.name, &1.id})

    render(conn, :index, lenses: lenses, manufacturers: manufacturers)
  end

  def new(conn, _params) do
    changeset = Settings.change_lens(%Lens{})

    manufacturers =
      Settings.list_manufacturers()
      |> Enum.map(&{&1.name, &1.id})

    render(conn, :new, changeset: changeset, manufacturers: manufacturers)
  end

  def create(conn, %{"lens" => lens_params}) do
    case Settings.create_lens(lens_params) do
      {:ok, lens} ->
        conn
        |> put_flash(:info, "Lens created successfully.")
        |> redirect(to: ~p"/lenses/#{lens}")

      {:error, %Ecto.Changeset{} = changeset} ->
        manufacturers = Settings.list_manufacturers() |> Enum.map(&{&1.name, &1.id})
        render(conn, :new, changeset: changeset, manufacturers: manufacturers)
    end
  end

  def show(conn, %{"id" => id}) do
    lens = Settings.get_lens!(id)
    manufacturer = Settings.get_manufacturer!(lens.manufacturer)
    # manufacturers =  Settings.list_manufacturers() |> Enum.map(&{&1.name, &1.id})
    render(conn, :show, lens: lens, manufacturer: manufacturer)
  end

  def edit(conn, %{"id" => id}) do
    lens = Settings.get_lens!(id)
    changeset = Settings.change_lens(lens)
    manufacturers = Settings.list_manufacturers() |> Enum.map(&{&1.name, &1.id})
    render(conn, :edit, lens: lens, changeset: changeset, manufacturers: manufacturers)
  end

  def update(conn, %{"id" => id, "lens" => lens_params}) do
    lens = Settings.get_lens!(id)

    case Settings.update_lens(lens, lens_params) do
      {:ok, lens} ->
        conn
        |> put_flash(:info, "Lens updated successfully.")
        |> redirect(to: ~p"/lenses/#{lens}")

      {:error, %Ecto.Changeset{} = changeset} ->
        manufacturers = Settings.list_manufacturers() |> Enum.map(&{&1.name, &1.id})
        render(conn, :edit, lens: lens, changeset: changeset, manufacturers: manufacturers)
    end
  end

  def delete(conn, %{"id" => id}) do
    lens = Settings.get_lens!(id)
    {:ok, _lens} = Settings.delete_lens(lens)

    conn
    |> put_flash(:info, "Lens deleted successfully.")
    |> redirect(to: ~p"/lenses")
  end
end
