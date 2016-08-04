defmodule Geonames.Endpoints.FindNearbyPOIsOSM do
  @behaviour Geonames.Endpoint

  @default_arguments %{
    lat: nil,
    lng: nil,
    radius: nil,
    maxRows: nil
  }

  def endpoint, do: "findNearbyPOIsOSMJSON"
  def available_url_parameters, do: Map.keys(@default_arguments)
  def required_url_parameters, do: [:lat, :lng]
  def function_name, do: :find_nearby_pois_osm

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
