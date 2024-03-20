defmodule FilmFlow.Repo do
  use Ecto.Repo,
    otp_app: :film_flow,
    adapter: Ecto.Adapters.Postgres
end
