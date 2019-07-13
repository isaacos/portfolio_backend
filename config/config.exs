# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :portfolio_backend,
  ecto_repos: [PortfolioBackend.Repo]

# Configures the endpoint
config :portfolio_backend, PortfolioBackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RhpBp0tLltwTgj+b2FwxrK/Oc7ujcB1DKCMsMpTL7Dpj34lyZ9Pqi9YtvFBI+rs1",
  render_errors: [view: PortfolioBackendWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PortfolioBackend.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :mime, :types, %{
  "application/json" => ["json"]
}
