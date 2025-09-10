defmodule Sk.MixProject do
  use Mix.Project

  def project do
    [
      app: :sk,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:toml_elixir, "~> 2.0.0"},
      {:calliope, "~> 0.4.2"},
    ]
  end
end
