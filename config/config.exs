# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :oiseau, Oiseau.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "/6qJY9pDCHeuIWea47PvI2AsA+JEcCDGciAhZDsDhY9bOkJgH90dAE0dZfvy/ieB",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Oiseau.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Neo4j
config :neo4j_sips, Neo4j,
  url: "http://localhost:7474",
  pool_size: 5,
  max_overflow: 2,
  timeout: 30,
  basic_auth: [username: "neo4j", password: "superpirates"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
