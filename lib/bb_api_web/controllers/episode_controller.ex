defmodule BbApiWeb.EpisodeController do
  use BbApiWeb, :controller

  alias BbApi.Episodes
  alias BbApi.Episodes.Episode

  action_fallback BbApiWeb.FallbackController

  def index(conn, _params) do
    episodes = Episodes.list_episodes()
    render(conn, "index.json", episodes: episodes)
  end

  def show(conn, %{"id" => id}) do
    episode = Episodes.get_episode!(id)
    render(conn, "show.json", episode: episode)
  end
end
