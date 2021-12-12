defmodule Geonames.Helpers do
  @moduledoc """
  The Helpers module provides a simple set of functions
  used by Geonames-Elixir. There is no real need to use
  any of the functions defined here directly.
  """

  @default_base_url "api.geonames.org"

  @doc """
  Determines whether or not all of the required
  request parameters have been set
  """
  def required_parameters_provided?(required, opts),
    do: Enum.all?(required, &Map.get(opts, &1))

  @doc """
  For each request to the GeoNames API, the
  URL parameters must be encoded. This function
  will take the user supplied parameters, merge
  them with the configured settings, and encode
  them into a URL string.
  """
  def build_url_string(endpoint, parameters) do
    encoded_params =
      user_configuration()
      |> Map.merge(parameters)
      |> Enum.map(fn
        {_, nil} -> nil
        {k, arr} when is_list(arr) -> Enum.map(arr, &"#{k}=#{&1}")
        {k, v} -> "#{k}=#{v}"
      end)
      |> List.flatten()
      |> Enum.reject(fn k -> is_nil(k) end)
      |> Enum.join("&")
      |> URI.encode()

    [base_url(), "/", endpoint, "?", encoded_params] |> Enum.join()
  end

  defp user_configuration do
    %{
      username: Application.get_env(:geonames, :username) || System.get_env("GEONAMES_USERNAME"),
      language:
        Application.get_env(:geonames, :language) || System.get_env("GEONAMES_LANGUAGE") || "en"
    }
  end

  defp base_url do
    url =
      Application.get_env(:geonames, :base_url) ||
        System.get_env("GEONAMES_BASE_URL") ||
        @default_base_url

    String.trim_trailing(url, "/")
  end
end
