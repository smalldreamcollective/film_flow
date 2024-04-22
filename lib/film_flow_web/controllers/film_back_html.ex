defmodule FilmFlowWeb.FilmBackHTML do
  use FilmFlowWeb, :html

  embed_templates "film_back_html/*"

  @doc """
  Renders a film_back form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def film_back_form(assigns)
end
