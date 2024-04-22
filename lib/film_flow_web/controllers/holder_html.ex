defmodule FilmFlowWeb.HolderHTML do
  use FilmFlowWeb, :html

  embed_templates "holder_html/*"

  @doc """
  Renders a holder form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def holder_form(assigns)
end
