import Config

# Only in tests, remove the complexity from the password hashing algorithm
config :bcrypt_elixir, :log_rounds, 1

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.

# For CI, DATABASE_URL is preferred. For local, allow individual vars or defaults.
# The default password is set to "password" to align with common CI/service setups.
config :film_flow, FilmFlow.Repo,
  # This will be used by CI
  url: System.get_env("DATABASE_URL"),
  username: System.get_env("PGUSER") || "postgres",
  # Default to "password"
  password: System.get_env("PGPASSWORD") || "password",
  hostname: System.get_env("PGHOST") || "localhost",
  database:
    System.get_env("PGDATABASE") || "film_flow_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :film_flow, FilmFlowWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Hw1XgVCONHcZI21JDa/eBOq8T9uirnej+5qAGm8eEZi+9TJ4EOudAjoG5JkWx/Kl",
  server: false

# In test we don't send emails.
config :film_flow, FilmFlow.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
