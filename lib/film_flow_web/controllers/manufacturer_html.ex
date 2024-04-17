defmodule FilmFlowWeb.ManufacturerHTML do
  use FilmFlowWeb, :html

  embed_templates "manufacturer_html/*"

  @doc """
  Renders a manufacturer form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def manufacturer_form(assigns)
end
