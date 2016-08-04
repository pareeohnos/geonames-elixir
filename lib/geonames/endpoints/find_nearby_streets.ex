defmodule Geonames.Endpoints.FindNearbyStreets do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    lat: nil,
    lng: nil,
    maxRows: 10
  }

  def endpoint, do: "findNearbyStreetsJSON"
  def available_url_parameters, do: Map.keys(@default_arguments)
  def required_url_parameters, do: [:lat, :lng]
  def function_name, do: :find_nearby_streets

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
