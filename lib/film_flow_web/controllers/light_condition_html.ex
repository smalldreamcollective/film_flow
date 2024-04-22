defmodule FilmFlowWeb.LightConditionHTML do
  use FilmFlowWeb, :html

  embed_templates "light_condition_html/*"

  @doc """
  Renders a light_condition form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def light_condition_form(assigns)
end
