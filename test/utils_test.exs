defmodule UtilsTest do
  use ExUnit.Case
  doctest Utils

  test "check current subdirs" do
    assert Utils.list_subdirs == ["test", "config", "_build", "lib"]
  end
end

