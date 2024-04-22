defmodule FilmFlowWeb.LightConditionController do
  use FilmFlowWeb, :controller

  alias FilmFlow.Settings
  alias FilmFlow.Settings.LightCondition

  def index(conn, _params) do
    light_conditions = Settings.list_light_conditions()
    render(conn, :index, light_conditions: light_conditions)
  end

  def new(conn, _params) do
    changeset = Settings.change_light_condition(%LightCondition{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"light_condition" => light_condition_params}) do
    case Settings.create_light_condition(light_condition_params) do
      {:ok, light_condition} ->
        conn
        |> put_flash(:info, "Light condition created successfully.")
        |> redirect(to: ~p"/light_conditions/#{light_condition}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    light_condition = Settings.get_light_condition!(id)
    render(conn, :show, light_condition: light_condition)
  end

  def edit(conn, %{"id" => id}) do
    light_condition = Settings.get_light_condition!(id)
    changeset = Settings.change_light_condition(light_condition)
    render(conn, :edit, light_condition: light_condition, changeset: changeset)
  end

  def update(conn, %{"id" => id, "light_condition" => light_condition_params}) do
    light_condition = Settings.get_light_condition!(id)

    case Settings.update_light_condition(light_condition, light_condition_params) do
      {:ok, light_condition} ->
        conn
        |> put_flash(:info, "Light condition updated successfully.")
        |> redirect(to: ~p"/light_conditions/#{light_condition}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, light_condition: light_condition, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    light_condition = Settings.get_light_condition!(id)
    {:ok, _light_condition} = Settings.delete_light_condition(light_condition)

    conn
    |> put_flash(:info, "Light condition deleted successfully.")
    |> redirect(to: ~p"/light_conditions")
  end
end
