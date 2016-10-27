# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :skylab,
  ecto_repos: [Skylab.Repo]

# Configures the endpoint
config :skylab, Skylab.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LVG3m9zOw75v7CBwhJdGvcaa4raf9ekE+OCOKKLL59/BArWt9ngWWWCK6U5ZnzUD",
  render_errors: [view: Skylab.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Skylab.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
