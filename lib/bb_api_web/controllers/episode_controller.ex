defmodule BbApiWeb.EpisodeController do
  use BbApiWeb, :controller

  alias BbApi.Episodes
  alias BbApi.Episodes.Episode

  action_fallback BbApiWeb.FallbackController

  def index(conn, _params) do
    episodes = Episodes.list_episodes()
    render(conn, "index.json", episodes: episodes)
  end

  def create(conn, %{"episode" => episode_params}) do
    with {:ok, %Episode{} = episode} <- Episodes.create_episode(episode_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", episode_path(conn, :show, episode))
      |> render("show.json", episode: episode)
    end
  end

  def show(conn, %{"id" => id}) do
    episode = Episodes.get_episode!(id)
    render(conn, "show.json", episode: episode)
  end

  def update(conn, %{"id" => id, "episode" => episode_params}) do
    episode = Episodes.get_episode!(id)

    with {:ok, %Episode{} = episode} <- Episodes.update_episode(episode, episode_params) do
      render(conn, "show.json", episode: episode)
    end
  end

  def delete(conn, %{"id" => id}) do
    episode = Episodes.get_episode!(id)
    with {:ok, %Episode{}} <- Episodes.delete_episode(episode) do
      send_resp(conn, :no_content, "")
    end
  end
end
