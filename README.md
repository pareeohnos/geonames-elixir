# Geonames

Geonames-Elixir is a simple wrapper around the Geonames.org API. It aims to provide
simple access to all available API endpoints that return a JSON result.

## Installation

To install GeoNames-Elixir, follow these instructions:

- Add geonames-elixir to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{ :geonames, "~> 1.0.1" }]
  end
  ```

- Ensure geonames is started before your application:

  ```elixir
  def application do
    [applications: [:geonames]]
  end
  ```


## Usage

Usage of GeoNames-Elixir is extremely simple:

  ```elixir
  Geonames.<function name>(%{ <parameters> })
  ```

Every function accepts a single argument. This is a map containing
all of the parameters required for the API call being made. The
available option can be found in the documentation using the `h`
function, or by looking through the [geonames.org](http://www.geonames.org/export/ws-overview.html)
documentation.


## Configuration

Before you can use GeoNames-Elixir, you must configure it with your
username, and preferred language. This can be done by simply adding
the following to your application configuration

  ```elixir
  config :geonames,
    username: "demo",
    language: "en"
  ```

Alternatively, you can set these with the environment variables

  ```
  GEONAMES_USERNAME=demo
  GEONAMES_LANGUAGE=en
  ```

Note that the language is not required, and will default to `en`
if not set.

Please also not the that language may not effect every API call.
It will be supplied for all, however the geonames.org documentation
does not specify its usage in every endpoint, so there are no
guarantees that your preferred language will be effective.


## Available functions

GeoNames-Elixir provides the following functions. Each function
name maps directly the API provided name for simplicity.

  ```elixir
  Geonames.astergdem/1
  Geonames.children/1
  Geonames.cities/1
  Geonames.contains/1
  Geonames.country_code/1
  Geonames.country_info/1
  Geonames.country_subdivision/1
  Geonames.earthquakes/1
  Geonames.find_nearby/1
  Geonames.find_nearby_place_name/1
  Geonames.find_nearby_postal_codes/1
  Geonames.find_nearby_streets/1
  Geonames.find_nearby_streets_osm/1
  Geonames.find_nearby_weather/1
  Geonames.find_nearby_wikipedia/1
  Geonames.find_nearby_address/1
  Geonames.find_nearby_intersection/1
  Geonames.find_nearby_intersection_osm/1
  Geonames.get/1
  Geonames.gtopo30/1
  Geonames.hierarchy/1
  Geonames.neighbourhood/1
  Geonames.neighbours/1
  Geonames.ocean/1
  Geonames.postal_code_country_info/1
  Geonames.postal_code_lookup/1
  Geonames.postal_code_search/1
  Geonames.search/1
  Geonames.siblings/1
  Geonames.srtm1/1
  Geonames.srtm3/1
  Geonames.timezone/1
  Geonames.weather/1
  Geonames.weather_icao/1
  Geonames.wikipedia_bounding_box/1
  Geonames.wikipedia_search/1
  ```

If you have an API URL you would like to query directly, then you
can use the following function

  ```elixir
  Geonames.perform_geonames_request(url)
  ```

Please note that this function assumes that the response will be
JSON. Using the XML endpoints of the API WILL NOT WORK.


## Todo

- Add support for the premium API plans
- Write tests

## Issues and contributions

Please feel free to use the issue tracker for bugs and requests, but for bugs
please provide as much information as possible.

Pull requests are welcomed.

## License

GeoNames-Elixir is Licensed under MIT.
