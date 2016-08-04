defmodule Geonames.Endpoints.Hierarchy do
  @behaviour Geonames.Endpoint

  @default_arguments %{
    geonameId: nil
  }

  def endpoint, do: "hierarchyJSON"
  def available_url_parameters, do: [:geonameId]
  def required_url_parameters, do: [:geonameId]
  def function_name, do: :hierarchy

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
