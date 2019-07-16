defmodule PortfolioBackend.View.Recommendation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recommendations" do
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(recommendation, params) do
    recommendation
    |> cast(params, [:text])
    |> validate_required([:text])
  end
end
