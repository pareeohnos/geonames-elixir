defmodule Geonames.Endpoints.Astergdem do
  @behaviour Geonames.Endpoint

  @default_arguments %{
    lat: nil,
    lng: nil
  }

  def endpoint, do: "astergdemJSON"
  def available_url_parameters, do: [:lat, :lng]
  def required_url_parameters, do: [:lat, :lng]
  def function_name, do: :astergdem

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
