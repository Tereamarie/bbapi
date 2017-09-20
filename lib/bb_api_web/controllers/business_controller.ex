defmodule BbApiWeb.BusinessController do
  use BbApiWeb, :controller

  alias BbApi.Gags
  alias BbApi.Gags.Business

  action_fallback BbApiWeb.FallbackController

  def index(conn, _params) do
    businesses = Gags.list_businesses()
    render(conn, "index.json", businesses: businesses)
  end

  def create(conn, %{"business" => business_params}) do
    with {:ok, %Business{} = business} <- Gags.create_business(business_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", business_path(conn, :show, business))
      |> render("show.json", business: business)
    end
  end

  def show(conn, %{"id" => id}) do
    business = Gags.get_business!(id)
    render(conn, "show.json", business: business)
  end

  def update(conn, %{"id" => id, "business" => business_params}) do
    business = Gags.get_business!(id)

    with {:ok, %Business{} = business} <- Gags.update_business(business, business_params) do
      render(conn, "show.json", business: business)
    end
  end

  def delete(conn, %{"id" => id}) do
    business = Gags.get_business!(id)
    with {:ok, %Business{}} <- Gags.delete_business(business) do
      send_resp(conn, :no_content, "")
    end
  end
end
