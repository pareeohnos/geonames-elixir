defmodule Geonames.Endpoints.FindNearbyWikipedia do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    lat: nil,
    lng: nil,
    radius: nil,
    postalcode: nil,
    country: nil,
    maxRows: nil
  }

  def endpoint, do: "findNearbyWikipediaJSON"
  def available_url_parameters, do: Map.keys(@default_arguments)
  def required_url_parameters, do: []
  def function_name, do: :find_nearby_wikipedia

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end
end
