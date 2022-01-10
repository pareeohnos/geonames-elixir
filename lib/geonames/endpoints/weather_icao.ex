defmodule Geonames.Endpoints.WeatherICAO do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    ICAO: nil
  }

  def endpoint, do: "weatherIcaoJSON"
  def available_url_parameters, do: Map.keys(@default_arguments)
  def required_url_parameters, do: [:ICAO]
  def function_name, do: :weather_icao

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end
end
