defmodule Geonames.Endpoints.FindNearbyPostalCodes do
  @behaviour Geonames.Endpoint

  @default_arguments %{
    lat: nil,
    lng: nil,
    postalCode: nil,
    country: nil,
    radius: nil,
    maxRows: 5,
    style: "MEDIUM",
    localCountry: nil,
    cities: nil
  }

  def endpoint, do: "findNearbyPostalCodesJSON"
  def available_url_parameters, do: Map.keys(@default_arguments)
  def required_url_parameters, do: []
  def function_name, do: :find_nearby_postal_codes

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
