defmodule PortfolioBackend.Repo do
  use Ecto.Repo,
    otp_app: :portfolio_backend,
    adapter: Ecto.Adapters.Postgres
end
