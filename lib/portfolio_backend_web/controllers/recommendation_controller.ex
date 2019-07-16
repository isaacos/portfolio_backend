defmodule PortfolioBackendWeb.RecommendationController do
  use PortfolioBackendWeb, :controller

  alias PortfolioBackend.View
  alias PortfolioBackend.View.Recommendation

  action_fallback PortfolioBackendWeb.FallbackController

  def index(conn, _params) do
    recommendations = PortfolioBackend.Repo.all(Recommendation)
    render(conn, recommendations: recommendations)

  end

  def create(conn, params) do
    # with {:ok, %Recommendation{} = recommendation} <- PortfolioBackend.create_recommendation(recommendation_params) do
    #   conn
    #   |> put_status(:created)
    #   |> put_resp_header("location", Routes.recommendation_path(conn, :show, recommendation))
    #   |> render( "show.json", recommendation: recommendation)
    #   end
        # recommendation = PortfolioBackend.Repo.insert!(%PortfolioBackend.View.Recommendation(params))
        PortfolioBackend.View.create_recommendation(params)
        json conn, params
  end

  def show(conn, %{"id" => id}) do
    recommendation = View.get_recommendation!(id)
    render(conn, "show.json", recommendation: recommendation)
  end

  def update(conn, %{"id" => id, "recommendation" => recommendation_params}) do
    recommendation = View.get_recommendation!(id)

    with {:ok, %Recommendation{} = recommendation} <- View.update_recommendation(recommendation, recommendation_params) do
      render(conn, "show.json", recommendation: recommendation)
    end
  end

  def delete(conn, %{"id" => id}) do
    recommendation = View.get_recommendation!(id)

    with {:ok, %Recommendation{}} <- View.delete_recommendation(recommendation) do
      send_resp(conn, :no_content, "")
    end
  end
end
