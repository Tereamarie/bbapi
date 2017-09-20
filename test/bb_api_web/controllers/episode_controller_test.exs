defmodule BbApiWeb.EpisodeControllerTest do
  use BbApiWeb.ConnCase

  alias BbApi.Episodes
  alias BbApi.Episodes.Episode

  @create_attrs %{air_date: "some air_date", name: "some name", season: "some season", season_episode: "some season_episode", series_episode: "some series_episode"}
  @update_attrs %{air_date: "some updated air_date", name: "some updated name", season: "some updated season", season_episode: "some updated season_episode", series_episode: "some updated series_episode"}
  @invalid_attrs %{air_date: nil, name: nil, season: nil, season_episode: nil, series_episode: nil}

  def fixture(:episode) do
    {:ok, episode} = Episodes.create_episode(@create_attrs)
    episode
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all episodes", %{conn: conn} do
      conn = get conn, episode_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create episode" do
    test "renders episode when data is valid", %{conn: conn} do
      conn = post conn, episode_path(conn, :create), episode: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, episode_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "air_date" => "some air_date",
        "name" => "some name",
        "season" => "some season",
        "season_episode" => "some season_episode",
        "series_episode" => "some series_episode"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, episode_path(conn, :create), episode: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update episode" do
    setup [:create_episode]

    test "renders episode when data is valid", %{conn: conn, episode: %Episode{id: id} = episode} do
      conn = put conn, episode_path(conn, :update, episode), episode: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, episode_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "air_date" => "some updated air_date",
        "name" => "some updated name",
        "season" => "some updated season",
        "season_episode" => "some updated season_episode",
        "series_episode" => "some updated series_episode"}
    end

    test "renders errors when data is invalid", %{conn: conn, episode: episode} do
      conn = put conn, episode_path(conn, :update, episode), episode: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete episode" do
    setup [:create_episode]

    test "deletes chosen episode", %{conn: conn, episode: episode} do
      conn = delete conn, episode_path(conn, :delete, episode)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, episode_path(conn, :show, episode)
      end
    end
  end

  defp create_episode(_) do
    episode = fixture(:episode)
    {:ok, episode: episode}
  end
end
