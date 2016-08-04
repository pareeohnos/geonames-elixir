defmodule Geonames.Endpoint do
  @moduledoc """
  An `Endpoint` is a behaviour module used to defined
  the different endpoints available on the Geonames
  API. The functions are used to generate the wrapper
  functions made available to developers via the
  `Geonames` module.
  """

  @callback endpoint :: String.t
  @callback available_url_parameters :: list(Atom.t)
  @callback required_url_parameters :: list(Atom.t)
  @callback function_name :: Atom.t
  @callback url_arguments(map) :: map
end
