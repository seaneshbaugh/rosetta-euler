defmodule Euler do
  def collatz(n) when is_integer(n) and n <= 1 do
    1
  end

  def collatz(n) when is_integer(n) and rem(n, 2) != 0 do
    (3 * n) + 1
  end

  def collatz(n) when is_integer(n) do
    round(n / 2)
  end

  def collatz_sequence(n) when is_integer(n) and n >= 1 do
    _collatz_sequence([n])
  end

  defp _collatz_sequence([h | _] = list) when h > 1 do
    _collatz_sequence([collatz(h) | list])
  end

  defp _collatz_sequence(list) do
    list
  end
end

(1..1000000) |>
Enum.map(fn(x) -> Euler.collatz_sequence(x) end) |>
Enum.reduce(HashDict.new, fn(x, acc) -> HashDict.put(acc, x, length(x)) end) |>
Enum.max(fn({_, v}) -> v end) |>
elem(0) |>
List.last |>
IO.puts
