# Geonames

Geonames-Elixir is a simple wrapper around the Geonames.org API. It aims to provide
simple access to all available API endpoints that return a JSON result.

## Installation

To install GeoNames-Elixir, follow these instructions:

- Add geonames-elixir to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{ :geonames, "~> 0.0.1" }]
end
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add geonames to your list of dependencies in `mix.exs`:

        def deps do
          [{:geonames, "~> 0.0.1"}]
        end

  2. Ensure geonames is started before your application:

        def application do
          [applications: [:geonames]]
        end
