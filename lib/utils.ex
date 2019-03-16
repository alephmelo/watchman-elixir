defmodule Utils do
  def list_subdirs(dir \\ ".") do
    Enum.filter(File.ls!(dir), fn sub_dir ->
      if File.dir?(sub_dir) and not String.starts_with?(sub_dir, ".") do
        sub_dir
      end
    end)
  end
end
