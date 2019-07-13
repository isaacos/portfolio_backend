defmodule PortfolioBackendWeb.RecommendationControllerTest do
  use PortfolioBackendWeb.ConnCase

  alias PortfolioBackend.View
  alias PortfolioBackend.View.Recommendation

  @create_attrs %{
    text: "some text"
  }
  @update_attrs %{
    text: "some updated text"
  }
  @invalid_attrs %{text: nil}

  def fixture(:recommendation) do
    {:ok, recommendation} = View.create_recommendation(@create_attrs)
    recommendation
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all recommendations", %{conn: conn} do
      conn = get(conn, Routes.recommendation_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create recommendation" do
    test "renders recommendation when data is valid", %{conn: conn} do
      conn = post(conn, Routes.recommendation_path(conn, :create), recommendation: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.recommendation_path(conn, :show, id))

      assert %{
               "id" => id,
               "text" => "some text"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.recommendation_path(conn, :create), recommendation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update recommendation" do
    setup [:create_recommendation]

    test "renders recommendation when data is valid", %{conn: conn, recommendation: %Recommendation{id: id} = recommendation} do
      conn = put(conn, Routes.recommendation_path(conn, :update, recommendation), recommendation: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.recommendation_path(conn, :show, id))

      assert %{
               "id" => id,
               "text" => "some updated text"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, recommendation: recommendation} do
      conn = put(conn, Routes.recommendation_path(conn, :update, recommendation), recommendation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete recommendation" do
    setup [:create_recommendation]

    test "deletes chosen recommendation", %{conn: conn, recommendation: recommendation} do
      conn = delete(conn, Routes.recommendation_path(conn, :delete, recommendation))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.recommendation_path(conn, :show, recommendation))
      end
    end
  end

  defp create_recommendation(_) do
    recommendation = fixture(:recommendation)
    {:ok, recommendation: recommendation}
  end
end
