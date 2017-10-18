defmodule BbApiWeb.BusinessController do
  use BbApiWeb, :controller

  alias BbApi.Gags
  alias BbApi.Gags.Business

  action_fallback BbApiWeb.FallbackController

  def index(conn, _params) do
    businesses = Gags.list_businesses()
    render(conn, "index.json", businesses: businesses)
  end

  def show(conn, %{"id" => id}) do
    business = Gags.get_business!(id)
    render(conn, "show.json", business: business)
  end
end
