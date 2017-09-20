defmodule BbApi.Repo.Migrations.EpisodesCharacters do
  use Ecto.Migration

  def change do
    create table(:episodes_characters, primary_key: false) do
      add :episode_id, references(:episodes)
      add :character_id, references(:characters)
    end
  end
end
