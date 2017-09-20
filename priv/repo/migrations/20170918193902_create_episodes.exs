defmodule BbApi.Repo.Migrations.CreateEpisodes do
  use Ecto.Migration

  def change do
    create table(:episodes) do
      add :name, :string
      add :air_date, :string
      add :season, :string
      add :season_episode, :string
      add :series_episode, :string

      timestamps()
    end

  end
end
