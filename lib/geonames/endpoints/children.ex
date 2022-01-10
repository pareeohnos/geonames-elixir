defmodule Geonames.Endpoints.Children do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    geonameId: nil,
    maxRows: 200,
    hierarchy: "tourism"
  }

  def endpoint, do: "childrenJSON"
  def available_url_parameters, do: [:geonameId, :maxRows, :hierarchy]
  def required_url_parameters, do: [:geonameId]
  def function_name, do: :children

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end
end
