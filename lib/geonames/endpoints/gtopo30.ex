defmodule Geonames.Endpoints.GTOPO30 do
  @behaviour Geonames.Endpoint

  @default_arguments %{
    lat: nil,
    lng: nil
  }

  def endpoint, do: "gtopo30JSON"
  def available_url_parameters, do: [:lat, :lng]
  def required_url_parameters, do: [:lat, :lng]
  def function_name, do: :gtopo30

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
