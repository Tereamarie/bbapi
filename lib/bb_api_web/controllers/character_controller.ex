defmodule BbApiWeb.CharacterController do
  use BbApiWeb, :controller

  alias BbApi.Characters
  alias BbApi.Characters.Character

  action_fallback BbApiWeb.FallbackController

  def index(conn, _params) do
    characters = Characters.list_characters()
    render(conn, "index.json", characters: characters)
  end

  def show(conn, %{"id" => id}) do
    character = Characters.get_character!(id)
    render(conn, "show.json", character: character)
  end
end
