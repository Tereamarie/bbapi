defmodule BbApiWeb.BurgerSpecialControllerTest do
  use BbApiWeb.ConnCase

  alias BbApi.Gags
  alias BbApi.Gags.BurgerSpecial

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:burger_special) do
    {:ok, burger_special} = Gags.create_burger_special(@create_attrs)
    burger_special
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all burger_specials", %{conn: conn} do
      conn = get conn, burger_special_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create burger_special" do
    test "renders burger_special when data is valid", %{conn: conn} do
      conn = post conn, burger_special_path(conn, :create), burger_special: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, burger_special_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, burger_special_path(conn, :create), burger_special: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update burger_special" do
    setup [:create_burger_special]

    test "renders burger_special when data is valid", %{conn: conn, burger_special: %BurgerSpecial{id: id} = burger_special} do
      conn = put conn, burger_special_path(conn, :update, burger_special), burger_special: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, burger_special_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, burger_special: burger_special} do
      conn = put conn, burger_special_path(conn, :update, burger_special), burger_special: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete burger_special" do
    setup [:create_burger_special]

    test "deletes chosen burger_special", %{conn: conn, burger_special: burger_special} do
      conn = delete conn, burger_special_path(conn, :delete, burger_special)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, burger_special_path(conn, :show, burger_special)
      end
    end
  end

  defp create_burger_special(_) do
    burger_special = fixture(:burger_special)
    {:ok, burger_special: burger_special}
  end
end
