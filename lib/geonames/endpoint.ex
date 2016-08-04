defmodule Geonames.Endpoint do
  @callback endpoint :: String.t
  @callback available_url_parameters :: list(Atom.t)
  @callback required_url_parameters :: list(Atom.t)
  @callback function_name :: Atom.t
  @callback url_arguments(map) :: map
end
