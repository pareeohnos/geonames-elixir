defmodule Geonames.Endpoints.WikipediaBoundingBox do
  @behaviour Geonames.Endpoint

  @default_arguments %{
    north: nil,
    south: nil,
    east: nil,
    west: nil,
    maxRows: 10
  }

  def endpoint, do: "wikipediaBoundingBoxJSON"
  def available_url_parameters, do: Map.keys(@default_arguments)
  def required_url_parameters, do: [:north, :south, :east, :west]
  def function_name, do: :wikipedia_bounding_box

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
