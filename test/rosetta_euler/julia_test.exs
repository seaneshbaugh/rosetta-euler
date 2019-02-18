Code.require_file "../rosetta_euler_test.exs", __DIR__
Code.require_file "../support/answers.exs", __DIR__

defmodule RosettaEuler.JuliaTest do
  use ExUnit.Case, async: true

  import RosettaEuler.Test, only: [rosetta_euler_tests: 2]
  import RosettaEuler.Answers, only: [answer_for: 1]

  setup context do
    {:ok, [test_number: context[:test_number]]}
  end

  def run_julia_solution(number) do
    name = number |> to_string |> String.pad_leading(3, "0")

    System.cmd("julia", [name <> ".jl"], cd: Path.join("julia", name))
  end

  rosetta_euler_tests 1..9 do
    @tag test_number: test_number
    test "Julia #" <> to_string(test_number), %{test_number: test_number} do
      answer = answer_for(test_number) <> "\n"

      {^answer, 0} = run_julia_solution(test_number)
    end
  end
end
