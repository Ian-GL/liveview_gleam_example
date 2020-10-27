# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :liveview_gleam_example,
  ecto_repos: [LiveviewGleamExample.Repo]

# Configures the endpoint
config :liveview_gleam_example, LiveviewGleamExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AY7FhuuFlnPTI2kgfsxmulbiZJ9ocI0EcDWaiLVg34SOLK8CYCFTW2oJ2ZAWFpH0",
  render_errors: [view: LiveviewGleamExampleWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveviewGleamExample.PubSub,
  live_view: [signing_salt: "WCvo7HUj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
