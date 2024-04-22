defmodule FilmFlowWeb.PhotographerHTML do
  use FilmFlowWeb, :html

  embed_templates "photographer_html/*"

  @doc """
  Renders a photographer form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def photographer_form(assigns)
end
