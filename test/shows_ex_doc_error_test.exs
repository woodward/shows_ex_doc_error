defmodule ShowsExDocErrorTest do
  use ExUnit.Case
  doctest ShowsExDocError

  test "greets the world" do
    assert ShowsExDocError.hello() == :world
  end
end
