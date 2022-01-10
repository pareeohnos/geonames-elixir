defmodule Geonames.Endpoints.CountryCode do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    lat: nil,
    lng: nil,
    type: nil,
    radius: nil
  }

  def endpoint, do: "countryCodeJSON"
  def available_url_parameters, do: [:lat, :lng, :type, :radius]
  def required_url_parameters, do: [:lat, :lng]
  def function_name, do: :country_code

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end
end
