use Mix.Config

config :backend, Backend.Repo,
  database: "backend_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

import_config "#{Mix.env()}.exs"

config :backend, ecto_repos: [Backend.Repo]
