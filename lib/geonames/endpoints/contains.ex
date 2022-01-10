defmodule Geonames.Endpoints.Contains do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    geonameId: nil,
    featureClass: nil,
    featureCode: nil
  }

  def endpoint, do: "containsJSON"
  def available_url_parameters, do: [:geonameId, :featureClass, :featureCode]
  def required_url_parameters, do: [:geonameId]
  def function_name, do: :contains

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end
end
