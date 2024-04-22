defmodule FilmFlowWeb.ApertureHTML do
  use FilmFlowWeb, :html

  embed_templates "aperture_html/*"

  @doc """
  Renders a aperture form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def aperture_form(assigns)
end
