defmodule BbApiWeb.PageController do
  use BbApiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
