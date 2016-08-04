defmodule Geonames do

  alias Geonames.Endpoints, as: EP
  alias Geonames.Helpers

  endpoints = [
    EP.Astergdem,
    EP.Children,
    EP.Cities,
    EP.Contains,
    EP.CountryCode,
    EP.CountrySubdivision,
    EP.Earthquakes,
    EP.FindNearby,
    EP.FindNearbyPlaceName,
    EP.FindNearbyPostalCodes,
    EP.FindNearbyStreets,
    EP.FindNearbyStreetsOSM,
    EP.FindNearbyWeather,
    EP.FindNearbyWikipedia,
    EP.FindNearestAddress,
    EP.FindNearestIntersection,
    EP.FindNearestIntersectionOSM,
    EP.FindNearbyPOIsOSM,
    EP.Get,
    EP.GTOPO30,
    EP.Hierarchy,
    EP.Neighbourhood,
    EP.Neighbours,
    EP.Ocean,
    EP.PostalCodeCountryInfo,
    EP.PostalCodeLookup,
    EP.PostalCodeSearch,
    EP.Search,
    EP.Siblings,
    EP.SRTM1,
    EP.SRTM3,
    EP.Timezone,
    EP.Weather,
    EP.WeatherICAO,
    EP.WikipediaBoundingBox,
    EP.WikipediaSearch
  ]

  for endpoint <- endpoints do
    @doc """
    Makes a request to the GeoNames endpoint `/#{endpoint.endpoint}`
    The arguments map may contain the following keys:

    #{Enum.map(endpoint.available_url_parameters, fn(e) -> "- #{e}\n" end)}

    Each request parameter should be supplied in a map. For example,

        Geonames.#{endpoint.function_name}(%{
          #{Enum.join(Enum.map(endpoint.available_url_parameters, fn(e) -> "#{to_string(e)}: \"val\"" end), ",\n      ")}
        })

    """
    @spec unquote(endpoint.function_name)(map) :: { Atom.t, map }
    def unquote(endpoint.function_name)(args) do
      url_params = unquote(endpoint).url_arguments(args)
      case Helpers.required_parameters_provided?(unquote(endpoint).required_url_parameters, url_params) do
        true ->
          url = Helpers.build_url_string(unquote(endpoint).endpoint, url_params)
          case perform_geonames_request(url) do
            { :ok, json_response } ->
              json_response
            { :error, error_message } ->
              raise RuntimeError, message: error_message
          end
        false ->
          raise ArgumentError, message: "Not all required parameters were supplied"
      end
    end
  end


  @doc """
  Performs a simple get request to the specified URL.
  This is not specific to GeoNames and could be used
  for any basic GET request, but it assumes the response
  is in JSON.

  This function will return one of two values

      { :ok, %{ ... }}
      { :error, "Reason" }

  A successful request will return a parsed Map of the
  response. If an error occurs, an :error tuple will
  be returned with a string describing the error.

  """
  def perform_geonames_request(url) do
    case HTTPoison.get(url) do
      { :ok, %HTTPoison.Response{ status_code: 200, body: body }} ->
        { :ok, Poison.decode!(body) }

      { :ok, %HTTPoison.Response{ status_code: status_code, body: body }} ->
        { :error, "An unexpected #{status_code} response was received"}

      { :error, %HTTPoison.Error{ reason: reason }} ->
        { :error, "Request failed with the following error: #{to_string(reason)}" }
    end
  end

end
