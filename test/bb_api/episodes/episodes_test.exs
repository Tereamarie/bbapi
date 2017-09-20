defmodule BbApi.EpisodesTest do
  use BbApi.DataCase

  alias BbApi.Episodes

  describe "episodes" do
    alias BbApi.Episodes.Episode

    @valid_attrs %{air_date: "some air_date", name: "some name", season: "some season", season_episode: "some season_episode", series_episode: "some series_episode"}
    @update_attrs %{air_date: "some updated air_date", name: "some updated name", season: "some updated season", season_episode: "some updated season_episode", series_episode: "some updated series_episode"}
    @invalid_attrs %{air_date: nil, name: nil, season: nil, season_episode: nil, series_episode: nil}

    def episode_fixture(attrs \\ %{}) do
      {:ok, episode} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Episodes.create_episode()

      episode
    end

    test "list_episodes/0 returns all episodes" do
      episode = episode_fixture()
      assert Episodes.list_episodes() == [episode]
    end

    test "get_episode!/1 returns the episode with given id" do
      episode = episode_fixture()
      assert Episodes.get_episode!(episode.id) == episode
    end

    test "create_episode/1 with valid data creates a episode" do
      assert {:ok, %Episode{} = episode} = Episodes.create_episode(@valid_attrs)
      assert episode.air_date == "some air_date"
      assert episode.name == "some name"
      assert episode.season == "some season"
      assert episode.season_episode == "some season_episode"
      assert episode.series_episode == "some series_episode"
    end

    test "create_episode/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Episodes.create_episode(@invalid_attrs)
    end

    test "update_episode/2 with valid data updates the episode" do
      episode = episode_fixture()
      assert {:ok, episode} = Episodes.update_episode(episode, @update_attrs)
      assert %Episode{} = episode
      assert episode.air_date == "some updated air_date"
      assert episode.name == "some updated name"
      assert episode.season == "some updated season"
      assert episode.season_episode == "some updated season_episode"
      assert episode.series_episode == "some updated series_episode"
    end

    test "update_episode/2 with invalid data returns error changeset" do
      episode = episode_fixture()
      assert {:error, %Ecto.Changeset{}} = Episodes.update_episode(episode, @invalid_attrs)
      assert episode == Episodes.get_episode!(episode.id)
    end

    test "delete_episode/1 deletes the episode" do
      episode = episode_fixture()
      assert {:ok, %Episode{}} = Episodes.delete_episode(episode)
      assert_raise Ecto.NoResultsError, fn -> Episodes.get_episode!(episode.id) end
    end

    test "change_episode/1 returns a episode changeset" do
      episode = episode_fixture()
      assert %Ecto.Changeset{} = Episodes.change_episode(episode)
    end
  end
end
