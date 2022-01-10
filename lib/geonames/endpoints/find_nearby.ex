defmodule Geonames.Endpoints.FindNearby do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    lat: nil,
    lng: nil,
    featureClass: nil,
    featureCode: nil,
    radius: nil,
    maxRows: 10,
    style: "MEDIUM",
    localCountry: true
  }

  def endpoint, do: "findNearbyJSON"
  def available_url_parameters, do: Map.keys(@default_arguments)
  def required_url_parameters, do: [:lat, :lng]
  def function_name, do: :find_nearby

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end
end
