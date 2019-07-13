defmodule PortfolioBackend.Repo.Migrations.CreateRecommendations do
  use Ecto.Migration

  def change do
    create table(:recommendations) do
      add :text, :string

      timestamps()
    end

  end
end
