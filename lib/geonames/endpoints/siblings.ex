defmodule Geonames.Endpoints.Siblings do
  @moduledoc false
  @behaviour Geonames.Endpoint

  @default_arguments %{
    geonameId: nil
  }

  def endpoint, do: "siblingsJSON"
  def available_url_parameters, do: [:geonameId]
  def required_url_parameters, do: [:geonameId]
  def function_name, do: :siblings

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
