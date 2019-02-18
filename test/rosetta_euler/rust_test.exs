Code.require_file "../rosetta_euler_test.exs", __DIR__
Code.require_file "../support/answers.exs", __DIR__

defmodule RosettaEuler.RustTest do
  use ExUnit.Case, async: true

  import RosettaEuler.Test, only: [rosetta_euler_tests: 2]
  import RosettaEuler.Answers, only: [answer_for: 1]

  setup context do
    {:ok, [test_number: context[:test_number]]}
  end

  def run_rust_solution(number) do
    name = number |> to_string |> String.pad_leading(3, "0")

    path = Path.join("rust", name)

    toml_file_path = Path.join(path, "Cargo.toml")

    if File.exists?(toml_file_path) do
      {_, 0} = System.cmd("cargo", ["build"], cd: path)

      {pwd, 0} = System.cmd("pwd", [], cd: path)

      executable_path = Path.join([String.trim(pwd), "target", "debug", "euler_" <> name])

      System.cmd(executable_path, [], cd: path)
    else
      {_, 0} = System.cmd("rustc", [name <> ".rs"], cd: path)

      {pwd, 0} = System.cmd("pwd", [], cd: path)

      executable_path = Path.join(String.trim(pwd), name)

      System.cmd(executable_path, [], cd: path)
    end
  end

  rosetta_euler_tests 1..13 do
    @tag test_number: test_number
    test "Rust #" <> to_string(test_number), %{test_number: test_number} do
      answer = answer_for(test_number) <> "\n"

      {^answer, 0} = run_rust_solution(test_number)
    end
  end
end
