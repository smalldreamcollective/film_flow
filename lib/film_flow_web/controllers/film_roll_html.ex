defmodule FilmFlowWeb.FilmRollHTML do
  use FilmFlowWeb, :html

  embed_templates "film_roll_html/*"

  @doc """
  Renders a film_roll form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def film_roll_form(assigns)
end
