defmodule FilmFlowWeb.FilmTypeHTML do
  use FilmFlowWeb, :html

  embed_templates "film_type_html/*"

  @doc """
  Renders a film_type form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def film_type_form(assigns)
end
