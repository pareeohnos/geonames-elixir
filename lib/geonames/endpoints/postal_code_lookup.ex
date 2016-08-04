defmodule Geonames.Endpoints.PostalCodeLookup do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    postalcode: nil,
    country: nil,
    maxRows: 20
  }

  def endpoint, do: "postalCodeLookupJSON"
  def available_url_parameters, do: [:postcalcode, :country, :maxRows]
  def required_url_parameters, do: [:postalcode, :country]
  def function_name, do: :postal_code_lookup

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
