defmodule BbApiWeb.PestControlVanController do
  use BbApiWeb, :controller

  alias BbApi.Gags
  alias BbApi.Gags.PestControlVan

  action_fallback BbApiWeb.FallbackController

  def index(conn, _params) do
    pest_control_vans = Gags.list_pest_control_vans()
    render(conn, "index.json", pest_control_vans: pest_control_vans)
  end

  def show(conn, %{"id" => id}) do
    pest_control_van = Gags.get_pest_control_van!(id)
    render(conn, "show.json", pest_control_van: pest_control_van)
  end
end
