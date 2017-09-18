defmodule BbApiWeb.Router do
  use BbApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BbApiWeb do
    pipe_through :api
  end
end
