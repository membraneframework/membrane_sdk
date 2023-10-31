# Membrane SDK

[![Hex.pm](https://img.shields.io/hexpm/v/membrane_sdk.svg)](https://hex.pm/packages/membrane_sdk)
[![API Docs](https://img.shields.io/badge/api-docs-yellow.svg?style=flat)](https://hexdocs.pm/membrane_sdk)
[![CircleCI](https://circleci.com/gh/membraneframework/membrane_sdk.svg?style=svg)](https://circleci.com/gh/membraneframework/membrane_sdk)

This package provides all the plugins of the [Membrane Multimedia Framework](https://membraneframework.org) by depending on them. Check the `mix.exs` file for the list of packages. This package provides the whole power of Membrane, though it may take some time to compile and requires you to have installed all the native dependencies needed for all of the plugins.

## Installation

The package can be installed by adding `membrane_sdk` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:membrane_sdk, github: "~> 0.1"}
  ]
end
```


## Copyright and License

Copyright 2020, [Software Mansion](https://swmansion.com/?utm_source=git&utm_medium=readme&utm_campaign=membrane_sdk)

[![Software Mansion](https://logo.swmansion.com/logo?color=white&variant=desktop&width=200&tag=membrane-github)](https://swmansion.com/?utm_source=git&utm_medium=readme&utm_campaign=membrane_sdk)

Licensed under the [Apache License, Version 2.0](LICENSE)
