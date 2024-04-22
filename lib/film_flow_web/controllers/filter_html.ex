defmodule FilmFlowWeb.FilterHTML do
  use FilmFlowWeb, :html

  embed_templates "filter_html/*"

  @doc """
  Renders a filter form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def filter_form(assigns)
end
