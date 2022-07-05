import Config

config :backend, Backend.Repo,
  database: "backend_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :backend, ecto_repos: [Backend.Repo]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :assent, :json_library, Jason

config :lettuce,
  folders_to_watch: ["lib"],
  refresh_time: 1500,
  compiler_opts: ["--verbose"]

config :joken, default_signer: "secret"

import_config "#{Mix.env()}.exs"
