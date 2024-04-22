defmodule FilmFlowWeb.ExposureRecordHTML do
  use FilmFlowWeb, :html

  embed_templates "exposure_record_html/*"

  @doc """
  Renders a exposure_record form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def exposure_record_form(assigns)
end
