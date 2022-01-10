defmodule GeonamesTest do
  use ExUnit.Case
  doctest Geonames

  test "basic url generation with username and language in config" do
    assert Geonames.Helpers.build_url_string("test", %{}) ==
             "api.geonames.org/test?language=es&username=testuser"
  end

  test "omit nil values from url" do
    assert Geonames.Helpers.build_url_string("test", %{key: nil}) ==
             "api.geonames.org/test?language=es&username=testuser"
  end

  test "permit single variables" do
    assert Geonames.Helpers.build_url_string("test", %{featureClass: "value"}) ==
             "api.geonames.org/test?featureClass=value&language=es&username=testuser"

    assert Geonames.Helpers.build_url_string("test", %{featureClass: "values with spaces"}) ==
             "api.geonames.org/test?featureClass=values%20with%20spaces&language=es&username=testuser"
  end

  test "permit array varaibles" do
    assert Geonames.Helpers.build_url_string("test", %{featureClass: ["A", "P"]}) ==
             "api.geonames.org/test?featureClass=A&featureClass=P&language=es&username=testuser"
  end

  test "can override config settings" do
    assert Geonames.Helpers.build_url_string("test", %{language: "en", username: "testuser2"}) ==
             "api.geonames.org/test?language=en&username=testuser2"
  end
end
