use Mix.Config

config :backend, Friends.Repo,
  database: "backend_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"

import_config "#{Mix.env()}.exs"
