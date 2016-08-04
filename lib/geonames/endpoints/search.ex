defmodule Geonames.Endpoints.Search do
  @behaviour Geonames.Endpoint

  @default_arguments %{
    q: nil,
    name: nil,
    name_equals: nil,
    name_startsWith: nil,
    maxRows: nil,
    startRow: nil,
    country: nil,
    countryBias: nil,
    continentCode: nil,
    adminCode1: nil,
    adminCode2: nil,
    adminCode3: nil,
    featureClass: nil,
    featureCode: nil,
    cities: nil,
    style: nil,
    isNameRequired: nil,
    tag: nil,
    operator: nil,
    fuzzy: nil,
    north: nil,
    east: nil,
    south: nil,
    west: nil,
    searchlang: nil,
    orderby: nil,
    inclBbox: nil
  }

  def endpoint, do: "searchJSON"
  def available_url_parameters, do: Map.keys(@default_arguments)
  def required_url_parameters, do: []
  def function_name, do: :search

  def url_arguments(provided_arguments) do
    Map.merge(@default_arguments, provided_arguments)
  end

end
