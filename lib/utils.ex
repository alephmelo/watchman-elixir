defmodule Utils do
  @moduledoc """
  Documentation for Utils.
  """

  @doc """
  Utils module with helper functions.

  ## Examples

      iex> Utils.list_subdirs
      ["test", "config", "_build", "lib"]

  """
  def list_subdirs(dir \\ ".") do
    Enum.filter(File.ls!(dir), fn sub_dir ->
      if File.dir?(Path.join(dir, sub_dir)) and not String.starts_with?(sub_dir, ".") do
        sub_dir
      end
    end)
  end
end
