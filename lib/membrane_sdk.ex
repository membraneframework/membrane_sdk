defmodule Membrane.SDK do
  deps =
    Mix.Project.config()[:deps]
    |> Enum.reject(fn
      {_name, _version, opts} -> opts[:runtime] == false
      _other -> false
    end)
    |> Enum.sort()
    |> Enum.map_join("\n", fn {name, version} ->
      "| [`#{name}`](https://hexdocs.pm/#{name}) | #{version} |"
    end)

  @moduledoc """
  This package provides most of the packages of the [Membrane Framework](https://membrane.stream) by depending on them.

  The packages included are the following:

  | name | version |
  | --- | --- |
  #{deps}
  """
end
