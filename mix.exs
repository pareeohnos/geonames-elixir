defmodule Geonames.Mixfile do
  use Mix.Project

  def project do
    [
      app: :geonames,
      version: "1.0.3",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "GeoNames-Elixir",
      description: description(),
      package: package()
    ]
  end

  def application do
    [extra_applications: [:httpoison, :jason, :httpoison]]
  end

  defp deps do
    [
      {:jason, "> 1.0.0", optional: true},
      {:poison, "> 3.0.0", optional: true},
      {:httpoison, "~> 1.8"},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    A simple wrapper around the geonames.org JSON API
    """
  end

  defp package do
    [
      maintainers: ["Adrian Hooper"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/pareeohnos/geonames-elixir"},
      files: ~w(mix.exs README.md lib)
    ]
  end
end
