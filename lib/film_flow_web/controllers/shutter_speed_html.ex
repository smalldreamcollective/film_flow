defmodule FilmFlowWeb.ShutterSpeedHTML do
  use FilmFlowWeb, :html

  embed_templates "shutter_speed_html/*"

  @doc """
  Renders a shutter_speed form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def shutter_speed_form(assigns)
end
