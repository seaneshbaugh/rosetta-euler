defmodule Euler do
  def prime_factors(n) do
    prime_factors(n, 2, [])
  end

  def prime_factors(1, _, factors) do
    factors
  end

  def prime_factors(n, k, factors) when rem(n, k) == 0 do
    prime_factors(div(n, k), k, [k | factors])
  end

  def prime_factors(n, k, factors) do
    prime_factors(n, k + 1, factors)
  end

  def list_overlap(a, b) do
    list_overlap(:delete, a, b)
    |> Enum.concat(a)
    |> Enum.sort
  end

  defp list_overlap(:delete, [h | t], b) do
    list_overlap(:delete, t, List.delete(b, h))
  end

  defp list_overlap(:delete, a, []) do
    a
  end

  defp list_overlap(:delete, [], b) do
    b
  end
end

IO.puts 1..20
|> Enum.map(fn x -> Euler.prime_factors(x) end)
|> Enum.reduce([], fn (x, sum) -> Euler.list_overlap(x, sum) end)
|> List.flatten
|> Enum.reduce(1, fn (x, product) -> x * product end)
|> to_string
