defmodule Geonames.Mixfile do
  use Mix.Project

  def project do
    [app: :geonames,
     version: "1.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,

     name: "GeoNames-Elixir",
     description: description,
     package: package]
  end

  def application do
    [applications: [:logger, :poison, :httpoison]]
  end

  defp deps do
    [
      { :poison, "~> 2.0" },
      { :httpoison, "~> 0.9.0" },
      { :ex_doc, "~> 0.12", only: :dev }
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
      links: %{ "GitHub" => "https://github.com/pareeohnos/geonames-elixir"},
      files: ~w(mix.exs README.md lib)
    ]
  end

end
