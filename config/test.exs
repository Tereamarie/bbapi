use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bb_api, BbApiWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :bb_api, BbApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "brianemory",
  password: "",
  database: "bb_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
