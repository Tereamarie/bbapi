defmodule BbApi.Episodes.Episode do
  use Ecto.Schema
  import Ecto.Changeset
  alias BbApi.Episodes.Episode


  schema "episodes" do
    field :air_date, :string
    field :name, :string
    field :season, :string
    field :season_episode, :string
    field :series_episode, :string

    timestamps()
  end

  @doc false
  def changeset(%Episode{} = episode, attrs) do
    episode
    |> cast(attrs, [:name, :air_date, :season, :season_episode, :series_episode])
    |> validate_required([:name, :air_date, :season, :season_episode, :series_episode])
  end
end
