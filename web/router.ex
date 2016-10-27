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
    # forward "/docs", Absinthe.Plug.GraphiQL, schema: Skylab.Schema,
    #   graphql_endpoint: 'http://localhost:4000/graphql',
    #   headers: %{"authorization" => "BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJVU0s1N25mc3Jjd3Zmdm5aYXl5N3VMUEJuTUtHQ2RXeCIsInN1YiI6ImF1dGgwfDU3YjFmYWY5NzFjMTZjZTg3NGI5NGVkMiJ9.z_OTBfmOWlVqJL2OC0ku3XDy7OhuMy7ukTb6tGQjjak"}
    forward "/docs", Absinthe.Plug.GraphiQL, schema: Skylab.Schema
  end
end
