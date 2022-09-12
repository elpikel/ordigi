import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :ordigi, Ordigi.Repo,
  username: "postgres",
  password: System.get_env("DB_PASSWORD") || "localhost",
  hostname: System.get_env("DB_HOST") || "localhost",
  database: "ordigi_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ordigi, OrdigiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "nc5/l0+0whrj3ZEwPQw+FulnU4YJTM+qlIzJyPROYTRq+JKB2//pdd6NZMqSIU3R",
  server: false

# In test we don't send emails.
config :ordigi, Ordigi.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
