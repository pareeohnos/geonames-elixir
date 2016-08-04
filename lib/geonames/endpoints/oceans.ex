defmodule Geonames.Endpoints.Ocean do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    lat: nil,
    lng: nil,
    radius: nil
  }

  def endpoint, do: "oceanJSON"
  def available_url_parameters, do: [:lat, :lng]
  def required_url_parameters, do: [:lat, :lng]
  def function_name, do: :ocean

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
