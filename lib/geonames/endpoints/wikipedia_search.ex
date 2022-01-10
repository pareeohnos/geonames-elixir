defmodule Geonames.Endpoints.WikipediaSearch do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    q: nil,
    title: nil,
    maxRows: 10
  }

  def endpoint, do: "wikipediaSearchJSON"
  def available_url_parameters, do: Map.keys(@default_arguments)
  def required_url_parameters, do: [:q]
  def function_name, do: :wikipedia_search

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end
end
