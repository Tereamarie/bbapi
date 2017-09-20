defmodule BbApiWeb.Router do
  use BbApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BbApiWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", BbApiWeb do
    pipe_through :api

    resources "/burger_specials", BurgerSpecialController, except: [:new, :edit]
    resources "/pest_control_vans", PestControlVanController, except: [:new, :edit]
    resources "/businesses", BusinessController, except: [:new, :edit]
    resources "/episodes", EpisodeController, except: [:new, :edit]
    resources "/characters", CharacterController, except: [:new, :edit]
  end
end
