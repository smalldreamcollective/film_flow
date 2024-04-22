defmodule FilmFlowWeb.FilmHTML do
  use FilmFlowWeb, :html

  embed_templates "film_html/*"

  @doc """
  Renders a film form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def film_form(assigns)
end
