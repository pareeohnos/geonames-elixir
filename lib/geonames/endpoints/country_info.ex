defmodule Geonames.Endpoints.CountryInfo do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    country: nil,
  }

  def endpoint, do: "countryInfoJSON"
  def available_url_parameters, do: Map.keys(@default_arguments)
  def required_url_parameters, do: []
  def function_name, do: :country_info

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
