defmodule FilmFlowWeb.TripodHTML do
  use FilmFlowWeb, :html

  embed_templates "tripod_html/*"

  @doc """
  Renders a tripod form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :manufacturers, :list, required: true

  def tripod_form(assigns)
end
