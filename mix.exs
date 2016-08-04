defmodule Geonames.Mixfile do
  use Mix.Project

  def project do
    [app: :geonames,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,

     name: "GeoNames-Elixir",
     description: description,
     package: package]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :poison, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      { :poison, "~> 2.0" },
      { :httpoison, "~> 0.9.0" },
      {:ex_doc, "~> 0.12", only: :docs}
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

  defp docs do
    [

    ]
  end

end
