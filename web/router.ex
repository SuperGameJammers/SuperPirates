defmodule Oiseau.Router do
  use Oiseau.Web, :router

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

  scope "/", Oiseau do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/users", UserController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Oiseau do
  #   pipe_through :api
  # end
end
