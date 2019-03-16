defmodule Watchman do
  @moduledoc """
  Documentation for Watchman.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Watchman.hello()
      :world

  """
  def hello do
    :world
  end

  def main(dir \\ ".") do
    Enum.each(
      Utils.list_subdirs(dir),
      fn sub_dir ->
        sub_dir
        |> Utils.check_status
        |> Utils.print_result
      end
    )
  end
end
