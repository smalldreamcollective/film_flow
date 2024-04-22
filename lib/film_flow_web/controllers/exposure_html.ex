defmodule FilmFlowWeb.ExposureHTML do
  use FilmFlowWeb, :html

  embed_templates "exposure_html/*"

  @doc """
  Renders a exposure form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def exposure_form(assigns)
end
