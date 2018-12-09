# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :auctionWbesite,
  ecto_repos: [AuctionWbesite.Repo]

# Configures the endpoint
config :auctionWbesite, AuctionWbesiteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nQ/ouCZEwBZ3RHFC9v7tDe1ZvnK+rKhd7mquTsvD68tU1+o4D+w/bNdc4RvgK4Ts",
  render_errors: [view: AuctionWbesiteWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AuctionWbesite.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
