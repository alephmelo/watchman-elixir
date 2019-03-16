defmodule WatchmanTest do
  use ExUnit.Case
  doctest Watchman

  test "greets the world" do
    assert Watchman.hello() == :world
  end
end
