defmodule PortfolioBackendWeb.RecommendationView do
  use PortfolioBackendWeb, :view
  alias PortfolioBackendWeb.RecommendationView

  def render("index.json", %{recommendations: recommendations}) do
    %{data: render_many(recommendations, RecommendationView, "recommendation.json")}
  end

  def render("show.json", %{recommendation: recommendation}) do
    %{data: render_one(recommendation, RecommendationView, "recommendation.json")}
  end

  def render("recommendation.json", %{recommendation: recommendation}) do
    %{id: recommendation.id,
      text: recommendation.text}
  end
end
