defmodule Backend.MixProject do
  use Mix.Project

  def project do
    [
      app: :backend,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      releases: [
        prod: [
          include_executable_for: [:unix],
          steps: [:assemble, :tar]
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      # name of the application of any module implementing the Application
      mod: {Backend, []},
      extra_applications: [:logger, :plug_cowboy]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.5"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:poison, "~> 4.0"},

      # test helpers
      {:excoveralls, "~> 0.10", only: :test}
    ]
  end

  # Aliases are shortcut or tasks specifics to the current project
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "run:dev": ["run --no-halt"]
    ]
  end
end
