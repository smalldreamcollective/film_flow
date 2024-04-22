defmodule FilmFlowWeb.ISOHTML do
  use FilmFlowWeb, :html

  embed_templates "iso_html/*"

  @doc """
  Renders a iso form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def iso_form(assigns)
end
