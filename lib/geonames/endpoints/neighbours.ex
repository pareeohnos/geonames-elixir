defmodule Geonames.Endpoints.Neighbours do
  @behaviour Geonames.Endpoint

  @default_arguments %{
    geonameId: nil,
    country: nil
  }

  def endpoint, do: "neighboursJSON"
  def available_url_parameters, do: [:geonameId, :country]
  def required_url_parameters, do: []
  def function_name, do: :neighbours

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
