defmodule Geonames do
  @moduledoc """
  Geonames-Elixir is a simple wrapper around the API provided
  by geonames.org. All interaction with the API is provied by
  this module via easy to use functions.

  Each API endpoint maps to a single function, all of which
  requiring a map containing the parameters of the request.
  If no arguments are required, then the hash can be omited
  as it will default to %{}

  ## Examples

  Below you will find a few examples on how to query the
  geonames API.

  ###### General search

      Geonames.search %{ q: "London" }
      Geonames.search %{ q: "London, United Kingdom" }

  ###### Find cities in a bounding box

      Geonames.cities %{ north: 44.1, south: -9.9, east: -22.4, west: 55.2 }

  ###### Find earthquakes in a bounding box

      Geonames.earthquakes %{ north: 44.1, south: -9.9, east: -22.4, west: 55.2, date: "2015-05-30" }


  As you can see, the interface is very simple to use. All
  functions will return a map in the exact format returned
  by the API. Currently, Geonames-Elixir will make no attempt
  to format this response in any way.

  """

  alias Geonames.Endpoints, as: EP
  alias Geonames.Helpers

  endpoints = [
    EP.Astergdem,
    EP.Children,
    EP.Cities,
    EP.Contains,
    EP.CountryCode,
    EP.CountryInfo,
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

    #{Enum.map(endpoint.available_url_parameters, fn e -> "- #{e}\n" end)}

    Each request parameter should be supplied in a map. For example,

        Geonames.#{endpoint.function_name}(%{
          #{
      Enum.join(
        Enum.map(endpoint.available_url_parameters, fn e -> "#{to_string(e)}: \"val\"" end),
        ",\n      "
      )
    }
        })

    """
    @spec unquote(endpoint.function_name)(map() | keyword()) :: map()
    def unquote(endpoint.function_name)(args \\ %{}) do
      url_params = unquote(endpoint).url_arguments(Enum.into(args, %{}))

      unless Helpers.required_parameters_provided?(
               unquote(endpoint).required_url_parameters,
               url_params
             ),
             do: raise(ArgumentError, message: "Not all required parameters were supplied")

      unquote(endpoint).endpoint
      |> Helpers.build_url_string(url_params)
      |> perform_geonames_request()
      |> case do
        {:ok, json_response} -> json_response
        {:error, error_message} -> raise RuntimeError, message: error_message
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
  @spec perform_geonames_request(String.t()) :: {:ok, map()} | {:error, String.t()}
  def perform_geonames_request(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Geonames.JsonDecoder.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: status_code, body: _body}} ->
        {:error, "An unexpected #{status_code} response was received"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, "Request failed with the following error: #{to_string(reason)}"}
    end
  end
end
