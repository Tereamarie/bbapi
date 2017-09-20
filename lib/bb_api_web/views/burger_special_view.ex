defmodule BbApiWeb.BurgerSpecialView do
  use BbApiWeb, :view
  alias BbApiWeb.BurgerSpecialView

  def render("index.json", %{burger_specials: burger_specials}) do
    %{data: render_many(burger_specials, BurgerSpecialView, "burger_special.json")}
  end

  def render("show.json", %{burger_special: burger_special}) do
    %{data: render_one(burger_special, BurgerSpecialView, "burger_special.json")}
  end

  def render("burger_special.json", %{burger_special: burger_special}) do
    %{id: burger_special.id,
      name: burger_special.name}
  end
end
