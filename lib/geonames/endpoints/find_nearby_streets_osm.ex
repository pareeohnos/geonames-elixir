defmodule Geonames.Endpoints.FindNearbyStreetsOSM do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    lat: nil,
    lng: nil,
    radius: nil,
    maxRows: 10
  }

  def endpoint, do: "findNearbyStreetsOSMJSON"
  def available_url_parameters, do: Map.keys(@default_arguments)
  def required_url_parameters, do: [:lat, :lng]
  def function_name, do: :find_nearby_streets_osm

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end
end
