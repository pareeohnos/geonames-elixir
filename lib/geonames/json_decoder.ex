defmodule Geonames.JsonDecoder do
  @moduledoc """
  An interface module to the actual JSON decode library
  """

  @spec decode!(binary()) :: map()
  def decode!(json_string), do: json_library().decode!(json_string)

  defp json_library, do: Application.get_env(:geonames, :json_library, Poison)
end
