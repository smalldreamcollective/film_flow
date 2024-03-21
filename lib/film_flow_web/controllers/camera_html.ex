defmodule FilmFlowWeb.CameraHTML do
  use FilmFlowWeb, :html

  embed_templates "camera_html/*"

  @doc """
  Renders a camera form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def camera_form(assigns)
end
