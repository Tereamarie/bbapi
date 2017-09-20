defmodule BbApiWeb.PestControlVanView do
  use BbApiWeb, :view
  alias BbApiWeb.PestControlVanView

  def render("index.json", %{pest_control_vans: pest_control_vans}) do
    %{data: render_many(pest_control_vans, PestControlVanView, "pest_control_van.json")}
  end

  def render("show.json", %{pest_control_van: pest_control_van}) do
    %{data: render_one(pest_control_van, PestControlVanView, "pest_control_van.json")}
  end

  def render("pest_control_van.json", %{pest_control_van: pest_control_van}) do
    %{id: pest_control_van.id,
      name: pest_control_van.name}
  end
end
