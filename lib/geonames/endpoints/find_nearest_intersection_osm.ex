defmodule Geonames.Endpoints.FindNearestIntersectionOSM do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    lat: nil,
    lng: nil,
    radius: nil,
    maxRows: nil
  }

  def endpoint, do: "findNearestIntersectionOSMJSON"
  def available_url_parameters, do: Map.keys(@default_arguments)
  def required_url_parameters, do: [:lat, :lng]
  def function_name, do: :find_nearest_intersection_osm

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end
end
