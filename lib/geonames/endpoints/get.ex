defmodule Geonames.Endpoints.Get do
  @behaviour Geonames.Endpoint

  @default_arguments %{
    geonameId: nil,
    style: nil
  }

  def endpoint, do: "getJSON"
  def available_url_parameters, do: [:geonameId]
  def required_url_parameters, do: [:geonameId]
  def function_name, do: :get

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
