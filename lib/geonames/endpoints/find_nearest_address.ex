defmodule Geonames.Endpoints.FindNearestAddress do
  @behaviour Geonames.Endpoint

  @default_arguments %{
    lat: nil,
    lng: nil
  }

  def endpoint, do: "findNearestAddressJSON"
  def available_url_parameters, do: Map.keys(@default_arguments)
  def required_url_parameters, do: [:lat, :lng]
  def function_name, do: :find_nearest_address

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
