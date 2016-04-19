Code.require_file "../rosetta_euler_test.exs", __DIR__
Code.require_file "../support/answers.exs", __DIR__

defmodule RosettaEuler.SimulaTest do
  use ExUnit.Case, async: true

  import RosettaEuler.Test, only: [rosetta_euler_tests: 2]
  import RosettaEuler.Answers, only: [answer_for: 1]

  setup context do
    {:ok, [test_number: context[:test_number]]}
  end

  def run_simula_solution(number) do
    name = number |> to_string |> String.rjust(3, ?0)

    path = Path.join("simula", name)

    {_, 0} = System.cmd("make", [], cd: path, stderr_to_stdout: true)

    {pwd, 0} = System.cmd("pwd", [], cd: path)

    executable_path = Path.join(String.strip(pwd), name)

    System.cmd(executable_path, [], cd: path)
  end

  rosetta_euler_tests 1..6 do
    @tag test_number: test_number
    test "Simula #" <> to_string(test_number), %{test_number: test_number} do
      # This is a little different from other tests because binaries created by Cim report the number of gabrage collections when run.
      expected = answer_for(test_number)

      {answer, 0} = run_simula_solution(test_number)

      ^expected = answer |> String.split("\n") |> List.first
    end
  end
end
