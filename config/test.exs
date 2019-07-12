use Mix.Config

# Configure your database
config :portfolio_backend, PortfolioBackend.Repo,
  username: "postgres",
  password: "postgres",
  database: "portfolio_backend_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :portfolio_backend, PortfolioBackendWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
