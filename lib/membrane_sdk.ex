defmodule Membrane.SDK do
  sdk_deps =
    Mix.Project.config()[:deps]
    |> Enum.filter(fn
      {_name, _version, opts} -> opts[:runtime] != false
      {_name, opts} when is_list(opts) -> false
      _other -> true
    end)
    |> Enum.map(fn
      {name, version, _opts} -> {name, version}
      {name, version} -> {name, version}
    end)

  sdk_deps_str =
    sdk_deps
    |> Enum.sort()
    |> Enum.map_join("\n", fn {name, version} ->
      "| [`#{name}`](https://hexdocs.pm/#{name}) | #{version} |"
    end)

  @moduledoc """
  This package provides most of the packages of the [Membrane Framework](https://membrane.stream) by depending on them.

  The packages included are the following:

  | name | version |
  | --- | --- |
  #{sdk_deps_str}
  """

  @doc """
  Prints deps with versions updated to the ones in the SDK.
  """
  @spec update_deps_versions([name | {name, version} | {name, version, opts} | {name, opts}]) ::
          :ok
        when name: atom,
             version: String.t(),
             opts: Keyword.t()

  def update_deps_versions(deps) do
    sdk_deps = unquote(sdk_deps)

    deps
    |> Enum.map(fn dep ->
      {name, version, opts} =
        case dep do
          name when is_atom(name) -> {name, nil, []}
          {name, version, opts} -> {name, version, opts}
          {name, opts} when is_list(opts) -> {name, nil, opts}
          {name, version} -> {name, version, []}
        end

      case sdk_deps[name] do
        nil -> {name, version, opts}
        sdk_version -> {name, sdk_version, Keyword.drop(opts, [:git, :github, :path])}
      end
    end)
    |> Enum.map_join(",\n  ", &inspect_dep/1)
    |> then(
      &"""
      [
        #{&1}
      ]
      """
    )
    |> IO.puts()
  end

  defp inspect_dep({name, version, opts}) do
    name = color_inspect(name)
    version = if version, do: color_inspect(version)

    opts =
      case opts do
        [] -> nil
        opts -> Enum.map_join(opts, ", ", fn {k, v} -> "#{k}: #{color_inspect(v)}" end)
      end

    [name, version, opts] |> Enum.filter(& &1) |> Enum.join(", ") |> then(&"{#{&1}}")
  end

  defp color_inspect(term) do
    inspect(term, syntax_colors: IO.ANSI.syntax_colors())
  end
end
