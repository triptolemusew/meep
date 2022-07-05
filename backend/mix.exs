defmodule Backend.MixProject do
  use Mix.Project

  def project do
    [
      app: :backend,
      version: "0.1.0",
      elixir: "~> 1.13.2",
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

  def application do
    [
      mod: {Backend, []},
      extra_applications: [:logger, :plug_cowboy]
    ]
  end

  defp deps do
    [
      {:plug_cowboy, "~> 2.5"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:timex, "~> 3.6"},
      {:assent, "~> 0.1.28"},
      {:joken, "~> 2.0"},
      {:jason, "~> 1.2"},
      {:dotenv, "~> 3.0.0"},

      # Dev
      {:lettuce, "~> 0.1.5", only: :dev},

      # Test helpers
      {:excoveralls, "~> 0.10", only: :test},
      {:faker, "~> 0.17.0", only: [:dev, :test]}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "seed:all": ["run priv/repo/seeds.exs"],
      "run:dev": ["run --no-halt"]
    ]
  end
end
