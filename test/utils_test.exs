defmodule UtilsTest do
  use ExUnit.Case
  doctest Utils

  test "check current subdirs" do
    assert Utils.list_subdirs == ["test", "config", "mock", "_build", "lib"]
  end

  test "check branch status" do
    assert Utils.check_status "mock" == {:ok, "mock", "develop"}
  end

  test "check print" do 
    assert Utils.print_result {:ok, "mock", "develop"} == :ok
  end
end
