defmodule BbApiWeb.BurgerSpecialController do
  use BbApiWeb, :controller

  alias BbApi.Gags
  alias BbApi.Gags.BurgerSpecial

  action_fallback BbApiWeb.FallbackController

  def index(conn, _params) do
    burger_specials = Gags.list_burger_specials()
    render(conn, "index.json", burger_specials: burger_specials)
  end

  def create(conn, %{"burger_special" => burger_special_params}) do
    with {:ok, %BurgerSpecial{} = burger_special} <- Gags.create_burger_special(burger_special_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", burger_special_path(conn, :show, burger_special))
      |> render("show.json", burger_special: burger_special)
    end
  end

  def show(conn, %{"id" => id}) do
    burger_special = Gags.get_burger_special!(id)
    render(conn, "show.json", burger_special: burger_special)
  end

  def update(conn, %{"id" => id, "burger_special" => burger_special_params}) do
    burger_special = Gags.get_burger_special!(id)

    with {:ok, %BurgerSpecial{} = burger_special} <- Gags.update_burger_special(burger_special, burger_special_params) do
      render(conn, "show.json", burger_special: burger_special)
    end
  end

  def delete(conn, %{"id" => id}) do
    burger_special = Gags.get_burger_special!(id)
    with {:ok, %BurgerSpecial{}} <- Gags.delete_burger_special(burger_special) do
      send_resp(conn, :no_content, "")
    end
  end
end
