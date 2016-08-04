defmodule Geonames.Endpoints.PostalCodeCountryInfo do
  @behaviour Geonames.Endpoint

  @default_arguments %{
  }

  def endpoint, do: "postalCodeCountryInfoJSON"
  def available_url_parameters, do: []
  def required_url_parameters, do: []
  def function_name, do: :postal_code_country_info

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
