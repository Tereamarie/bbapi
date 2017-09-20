defmodule BbApiWeb.PestControlVanController do
  use BbApiWeb, :controller

  alias BbApi.Gags
  alias BbApi.Gags.PestControlVan

  action_fallback BbApiWeb.FallbackController

  def index(conn, _params) do
    pest_control_vans = Gags.list_pest_control_vans()
    render(conn, "index.json", pest_control_vans: pest_control_vans)
  end

  def create(conn, %{"pest_control_van" => pest_control_van_params}) do
    with {:ok, %PestControlVan{} = pest_control_van} <- Gags.create_pest_control_van(pest_control_van_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", pest_control_van_path(conn, :show, pest_control_van))
      |> render("show.json", pest_control_van: pest_control_van)
    end
  end

  def show(conn, %{"id" => id}) do
    pest_control_van = Gags.get_pest_control_van!(id)
    render(conn, "show.json", pest_control_van: pest_control_van)
  end

  def update(conn, %{"id" => id, "pest_control_van" => pest_control_van_params}) do
    pest_control_van = Gags.get_pest_control_van!(id)

    with {:ok, %PestControlVan{} = pest_control_van} <- Gags.update_pest_control_van(pest_control_van, pest_control_van_params) do
      render(conn, "show.json", pest_control_van: pest_control_van)
    end
  end

  def delete(conn, %{"id" => id}) do
    pest_control_van = Gags.get_pest_control_van!(id)
    with {:ok, %PestControlVan{}} <- Gags.delete_pest_control_van(pest_control_van) do
      send_resp(conn, :no_content, "")
    end
  end
end
