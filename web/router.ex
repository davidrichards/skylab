defmodule Skylab.Router do
  use Skylab.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :graphql do
    plug GraphqlLogger
  end

  scope "/", Skylab do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/graphql" do
    pipe_through :graphql
    get "/", Absinthe.Plug, schema: Skylab.Schema
    post "/", Absinthe.Plug, schema: Skylab.Schema
  end

  if Mix.env == :dev do
    forward "/docs", Absinthe.Plug.GraphiQL, schema: Skylab.Schema
  end
end
