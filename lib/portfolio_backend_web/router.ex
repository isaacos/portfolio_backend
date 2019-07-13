defmodule PortfolioBackendWeb.Router do
  use PortfolioBackendWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])

  end

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  scope "/", PortfolioBackendWeb do
    pipe_through :browser
    get "/recommendations", RecommendationController, :index
  end

  # Other scopes may use custom stacks.
   scope "/api", PortfolioBackendWeb do
     pipe_through :api

     get "/recommendations", RecommendationController, :index
   end
end
