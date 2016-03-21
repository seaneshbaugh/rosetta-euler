defmodule RosettaEuler.Test do
  use ExUnit.Case, async: true

  defmacro rosetta_euler_tests(range, do: block) do
    quote do
      unquote(range) |> Enum.each(fn (number) ->
        var!(test_number) = number

        unquote(block)
      end)
    end
  end
end
