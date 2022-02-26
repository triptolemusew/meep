use Mix.Config

config :backend, Backend.Repo,
  database: "backend_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :extwitter, :oauth,
  consumer_key: "",
  consumer_secret: "",
  access_token: "",
  access_token_secret: ""

config :lettuce,
  folders_to_watch: ["lib"],
  refresh_time: 1500,
  compiler_opts: [
    "--verbose"
  ]

import_config "#{Mix.env()}.exs"

config :backend, ecto_repos: [Backend.Repo]
