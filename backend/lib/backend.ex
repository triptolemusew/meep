defmodule Backend do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      Backend.Repo,
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Backend.Endpoint,
        options: [port: String.to_integer(System.get_env("APP_PORT") || "4000")]
      )
    ]

    opts = [strategy: :one_for_one, name: Backend.Supervisor]

    IO.puts("Application starting...")

    Supervisor.start_link(children, opts)
  end
end
