defmodule PortfolioBackend.View.Recommendation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recommendations" do
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(recommendation, attrs) do
    recommendation
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
