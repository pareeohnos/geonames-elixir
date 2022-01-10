defmodule Geonames.Endpoints.PostalCodeSearch do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    postalcode: nil,
    postalcode_startsWith: nil,
    placename: nil,
    placename_startsWith: nil,
    country: nil,
    countryBias: nil,
    maxRows: 10,
    style: nil,
    operator: nil,
    isReduced: false,
    north: nil,
    east: nil,
    south: nil,
    west: nil
  }

  def endpoint, do: "postalCodeSearchJSON"
  def available_url_parameters, do: Map.keys(@default_arguments)
  def required_url_parameters, do: []
  def function_name, do: :postal_code_search

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end
end
