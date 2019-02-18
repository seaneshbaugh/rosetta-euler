Code.require_file "../rosetta_euler_test.exs", __DIR__
Code.require_file "../support/answers.exs", __DIR__

defmodule RosettaEuler.FSharpTest do
  use ExUnit.Case, async: true

  import RosettaEuler.Test, only: [rosetta_euler_tests: 2]
  import RosettaEuler.Answers, only: [answer_for: 1]

  setup context do
    {:ok, [test_number: context[:test_number]]}
  end

  def run_fsharp_solution(number) do
    name = number |> to_string |> String.pad_leading(3, "0")

    path = Path.join("fsharp", name)

    {_, 0} = System.cmd("fsharpc", [name <> ".fs"], cd: path)

    {pwd, 0} = System.cmd("pwd", [], cd: path)

    executable_path = Path.join(String.trim(pwd), name <> ".exe")

    System.cmd("mono", [executable_path], cd: path)
  end

  rosetta_euler_tests 1..8 do
    @tag test_number: test_number
    test "F# #" <> to_string(test_number), %{test_number: test_number} do
      answer = answer_for(test_number) <> "\n"

      {^answer, 0} = run_fsharp_solution(test_number)
    end
  end
end
