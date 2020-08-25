defmodule Mix.Tasks.Versions do
  use Mix.Task

  def run(_) do
    ada_version()
    IO.write("\n")
    algol68_version()
  end

  defp ada_version do
    {output, 0} = System.cmd("gnat", [])

    IO.puts "Ada:"
    IO.puts output |> String.split("\n") |> hd
  end

  defp algol68_version do
    {output, 0} = System.cmd("a68g", ["--version"])

    IO.puts "Algol68:"
    IO.puts output |> String.split("\n") |> hd
  end
end
