defmodule Geonames.Helpers do
  @moduledoc """
  The Helpers module provides a simple set of functions
  used by Geonames-Elixir. There is no real need to use
  any of the functions defined here directly.
  """

  @base_url Application.get_env(:geonames, :base_url, "api.geonames.org/")

  @doc """
  Determines whether or not all of the required
  request parameters have been set
  """
  def required_parameters_provided?(required, opts) do
    invalid =
      required
      |> Enum.map(fn(k) -> opts[k] end)
      |> Enum.member?(nil)

    !invalid
  end

  @doc """
  For each request to the GeoNames API, the
  URL parameters must be encoded. This function
  will take the user supplied parameters, merge
  them with the configured settings, and encode
  them into a URL string.
  """
  def build_url_string(endpoint, parameters) do
    encoded_params =
      user_configuration
      |> Map.merge(parameters)
      |> Enum.map(fn
        {_,nil}                    -> nil
        {k,v} when is_binary(v)    -> "#{k}=#{v}"
        {k,v} when is_float(v)    -> "#{k}=#{v}"
        {k,v} when is_boolean(v)    -> "#{k}=#{v}"
        {k,arr} when is_list(arr)  -> Enum.map(arr, &"#{k}=#{&1}")
      end)
      |> List.flatten
      |> Enum.filter(fn(k) -> !is_nil(k) end)
      |> Enum.join("&")
      |> URI.encode

    @base_url <> endpoint <> "?" <> encoded_params
  end


  defp user_configuration do
    %{
      username: Application.get_env(:geonames, :username) || System.get_env("GEONAMES_USERNAME"),
      language: Application.get_env(:geonames, :language, System.get_env("GEONAMES_LANGUAGE") || "en")
    }
  end

end
