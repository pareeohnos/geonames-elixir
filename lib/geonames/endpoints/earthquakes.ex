defmodule Geonames.Endpoints.Earthquakes do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    north: nil,
    south: nil,
    east: nil,
    west: nil,
    date: nil,
    minMagnitude: nil,
    maxRows: 10
  }

  def endpoint, do: "earthquakesJSON"
  def available_url_parameters, do: Map.keys(@default_arguments)
  def required_url_parameters, do: [:north, :south, :east, :west]
  def function_name, do: :earthquakes

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end
end
