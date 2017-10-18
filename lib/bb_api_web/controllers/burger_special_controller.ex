defmodule BbApiWeb.BurgerSpecialController do
  use BbApiWeb, :controller

  alias BbApi.Gags
  alias BbApi.Gags.BurgerSpecial

  action_fallback BbApiWeb.FallbackController

  def index(conn, _params) do
    burger_specials = Gags.list_burger_specials()
    render(conn, "index.json", burger_specials: burger_specials)
  end

  def show(conn, %{"id" => id}) do
    burger_special = Gags.get_burger_special!(id)
    render(conn, "show.json", burger_special: burger_special)
  end
end
