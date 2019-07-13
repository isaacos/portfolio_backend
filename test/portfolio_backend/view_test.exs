defmodule PortfolioBackend.ViewTest do
  use PortfolioBackend.DataCase

  alias PortfolioBackend.View

  describe "recommendations" do
    alias PortfolioBackend.View.Recommendation

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def recommendation_fixture(attrs \\ %{}) do
      {:ok, recommendation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> View.create_recommendation()

      recommendation
    end

    test "list_recommendations/0 returns all recommendations" do
      recommendation = recommendation_fixture()
      assert View.list_recommendations() == [recommendation]
    end

    test "get_recommendation!/1 returns the recommendation with given id" do
      recommendation = recommendation_fixture()
      assert View.get_recommendation!(recommendation.id) == recommendation
    end

    test "create_recommendation/1 with valid data creates a recommendation" do
      assert {:ok, %Recommendation{} = recommendation} = View.create_recommendation(@valid_attrs)
      assert recommendation.text == "some text"
    end

    test "create_recommendation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = View.create_recommendation(@invalid_attrs)
    end

    test "update_recommendation/2 with valid data updates the recommendation" do
      recommendation = recommendation_fixture()
      assert {:ok, %Recommendation{} = recommendation} = View.update_recommendation(recommendation, @update_attrs)
      assert recommendation.text == "some updated text"
    end

    test "update_recommendation/2 with invalid data returns error changeset" do
      recommendation = recommendation_fixture()
      assert {:error, %Ecto.Changeset{}} = View.update_recommendation(recommendation, @invalid_attrs)
      assert recommendation == View.get_recommendation!(recommendation.id)
    end

    test "delete_recommendation/1 deletes the recommendation" do
      recommendation = recommendation_fixture()
      assert {:ok, %Recommendation{}} = View.delete_recommendation(recommendation)
      assert_raise Ecto.NoResultsError, fn -> View.get_recommendation!(recommendation.id) end
    end

    test "change_recommendation/1 returns a recommendation changeset" do
      recommendation = recommendation_fixture()
      assert %Ecto.Changeset{} = View.change_recommendation(recommendation)
    end
  end
end
