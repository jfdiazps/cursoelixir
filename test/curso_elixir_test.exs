defmodule CursoElixirTest do
  use ExUnit.Case
  doctest CursoElixir

  test "greets the world" do
    assert CursoElixir.hello() == :world
  end
end
