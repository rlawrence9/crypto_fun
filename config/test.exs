import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :crypto_engine, CryptoEngine.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "crypto_engine_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :binance,
  ecto_repos: [CryptoEngine.Repo]

config :binance, Binance.API,
  binance_service: Binance.APIMock


config :crypto_web, CryptoWeb.LiveChart,
  genserver_adapter: CryptoWeb.LiveChartMock


config :crypto_web,
  ecto_repos: [CryptoEngine.Repo],
  binance_service: Binance.APIMock


# We don't run a server during test. If one is required,
# you can enable the server option below.
config :crypto_web, CryptoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "60Yk5JoMBPOTQI9aYm+zQ0qlsGbmkfAfyKarJHxOqiWyJLFd3YK6UIfoZ4lBplKK",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# In test we don't send emails.

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
