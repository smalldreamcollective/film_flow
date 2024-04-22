defmodule FilmFlowWeb.FormatHTML do
  use FilmFlowWeb, :html

  embed_templates "format_html/*"

  @doc """
  Renders a format form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def format_form(assigns)
end
