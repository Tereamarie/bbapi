defmodule BbApiWeb.PestControlVanControllerTest do
  use BbApiWeb.ConnCase

  alias BbApi.Gags
  alias BbApi.Gags.PestControlVan

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:pest_control_van) do
    {:ok, pest_control_van} = Gags.create_pest_control_van(@create_attrs)
    pest_control_van
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pest_control_vans", %{conn: conn} do
      conn = get conn, pest_control_van_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pest_control_van" do
    test "renders pest_control_van when data is valid", %{conn: conn} do
      conn = post conn, pest_control_van_path(conn, :create), pest_control_van: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, pest_control_van_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, pest_control_van_path(conn, :create), pest_control_van: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pest_control_van" do
    setup [:create_pest_control_van]

    test "renders pest_control_van when data is valid", %{conn: conn, pest_control_van: %PestControlVan{id: id} = pest_control_van} do
      conn = put conn, pest_control_van_path(conn, :update, pest_control_van), pest_control_van: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, pest_control_van_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, pest_control_van: pest_control_van} do
      conn = put conn, pest_control_van_path(conn, :update, pest_control_van), pest_control_van: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pest_control_van" do
    setup [:create_pest_control_van]

    test "deletes chosen pest_control_van", %{conn: conn, pest_control_van: pest_control_van} do
      conn = delete conn, pest_control_van_path(conn, :delete, pest_control_van)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, pest_control_van_path(conn, :show, pest_control_van)
      end
    end
  end

  defp create_pest_control_van(_) do
    pest_control_van = fixture(:pest_control_van)
    {:ok, pest_control_van: pest_control_van}
  end
end
