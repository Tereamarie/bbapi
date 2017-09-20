defmodule BbApiWeb.CharacterView do
  use BbApiWeb, :view
  alias BbApiWeb.CharacterView

  def render("index.json", %{characters: characters}) do
    %{data: render_many(characters, CharacterView, "character.json")}
  end

  def render("show.json", %{character: character}) do
    %{data: render_one(character, CharacterView, "character.json")}
  end

  def render("character.json", %{character: character}) do
    %{id: character.id,
      name: character.name,
      sex: character.sex,
      profession: character.profession,
      voiced_by: character.voiced_by}
  end
end
