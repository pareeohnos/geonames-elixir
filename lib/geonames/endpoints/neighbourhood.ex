defmodule Geonames.Endpoints.Neighbourhood do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    lat: nil,
    lng: nil
  }

  def endpoint, do: "neighbourhoodJSON"
  def available_url_parameters, do: [:lat, :lng]
  def required_url_parameters, do: [:lat, :lng]
  def function_name, do: :neighbourhood

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end
end
