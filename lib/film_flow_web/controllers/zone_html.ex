defmodule FilmFlowWeb.ZoneHTML do
  use FilmFlowWeb, :html

  embed_templates "zone_html/*"

  @doc """
  Renders a zone form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def zone_form(assigns)
end
