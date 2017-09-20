defmodule BbApiWeb.EpisodeView do
  use BbApiWeb, :view
  alias BbApiWeb.EpisodeView

  def render("index.json", %{episodes: episodes}) do
    %{data: render_many(episodes, EpisodeView, "episode.json")}
  end

  def render("show.json", %{episode: episode}) do
    %{data: render_one(episode, EpisodeView, "episode.json")}
  end

  def render("episode.json", %{episode: episode}) do
    %{id: episode.id,
      name: episode.name,
      air_date: episode.air_date,
      season: episode.season,
      season_episode: episode.season_episode,
      series_episode: episode.series_episode}
  end
end
