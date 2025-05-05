defmodule FilmFlowWeb.LensHTML do
  use FilmFlowWeb, :html

  embed_templates "lens_html/*"

  @doc """
  Renders a lens form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :manufacturers, :list, required: true

  def lens_form(assigns)
end
