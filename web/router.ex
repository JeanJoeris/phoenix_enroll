defmodule DbExperiment.Router do
  use DbExperiment.Web, :router

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

  scope "/", DbExperiment do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", DbExperiment do
    pipe_through :api

    resources "/cohorts/upcoming", DashboardController, only: [:index]
  end
end
