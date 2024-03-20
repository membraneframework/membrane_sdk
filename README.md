# Membrane SDK

[![Hex.pm](https://img.shields.io/hexpm/v/membrane_sdk.svg)](https://hex.pm/packages/membrane_sdk)
[![API Docs](https://img.shields.io/badge/api-docs-yellow.svg?style=flat)](https://hexdocs.pm/membrane_sdk)
[![CircleCI](https://circleci.com/gh/membraneframework/membrane_sdk.svg?style=svg)](https://circleci.com/gh/membraneframework/membrane_sdk)

This package provides most of the packages of the [Membrane Framework](https://membrane.stream) by depending on them - check the [docs](https://hexdocs.pm/membrane_sdk/Membrane.SDK.html) or the `mix.exs` file for the complete list.
In particular, all the packages maintained by the core team are included, except for the ones that require a specific environment or custom installation. Thus, Membrane SDK should work out of the box on most popular systems, including Mac OS, Ubuntu and Windows via WSL.

## Installation

The package can be installed by adding `membrane_sdk` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:membrane_sdk, "~> 0.2.0"}
  ]
end
```


## Copyright and License

Copyright 2020, [Software Mansion](https://swmansion.com/?utm_source=git&utm_medium=readme&utm_campaign=membrane_sdk)

[![Software Mansion](https://logo.swmansion.com/logo?color=white&variant=desktop&width=200&tag=membrane-github)](https://swmansion.com/?utm_source=git&utm_medium=readme&utm_campaign=membrane_sdk)

Licensed under the [Apache License, Version 2.0](LICENSE)
