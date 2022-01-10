defmodule Geonames.Endpoints.CountrySubdivision do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    lat: nil,
    lng: nil,
    radius: nil,
    level: nil
  }

  def endpoint, do: "countrySubdivisionJSON"
  def available_url_parameters, do: [:lat, :lng, :radius, :level]
  def required_url_parameters, do: [:lat, :lng]
  def function_name, do: :country_subdivision

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end
end
