defmodule PortfolioBackendWeb.PageController do
  use PortfolioBackendWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
