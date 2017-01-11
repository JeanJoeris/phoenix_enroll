# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :db_experiment,
  ecto_repos: [DbExperiment.Repo]

# Configures the endpoint
config :db_experiment, DbExperiment.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0QCFx8eac2AdQiH0dFHP+odlTeAXrUgBxnyAB3WjKBfhLkSs9RcYY7Qz6eGQnESe",
  render_errors: [view: DbExperiment.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DbExperiment.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
