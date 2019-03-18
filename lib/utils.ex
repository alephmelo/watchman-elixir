import IO.ANSI
defmodule Utils do
  @moduledoc """
  Documentation for Utils.
  """

  @doc """
  Utils module with helper functions.

  ## Examples

      iex> Utils.list_subdirs
      ["test", "config", "mock", "_build", "lib"]

  """
  def list_subdirs(dir \\ ".") do
    Enum.filter(File.ls!(dir), fn sub_dir ->
      if File.dir?(Path.join(dir, sub_dir)) and not String.starts_with?(sub_dir, ".") do
        sub_dir
      end
    end)
  end

  def check_status(sub_dir) do
    result =
      System.cmd(
        "git",
        ["--git-dir", "./#{sub_dir}/.git", "name-rev", "--name-only", "HEAD"],
        stderr_to_stdout: true
      )

    case result do
      {branch, 0} -> {:ok, sub_dir, String.replace_suffix(branch, "\n", "")}
      _ -> :error
    end
  end

  def print_result(result) do
    case result do
      {:ok, sub_dir, branch} ->
        IO.puts("Repository #{sub_dir} on branch #{green()}#{branch}#{reset()}")
        :ok

      _ ->
        :error
    end
  end
end
