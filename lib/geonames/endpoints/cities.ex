defmodule Geonames.Endpoints.Cities do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    north: nil,
    south: nil,
    east: nil,
    west: nil,
    maxRows: 10
  }

  def endpoint, do: "citiesJSON"
  def available_url_parameters, do: [:north, :south, :east, :west, :maxRows]
  def required_url_parameters, do: [:north, :south, :east, :west]
  def function_name, do: :cities

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
