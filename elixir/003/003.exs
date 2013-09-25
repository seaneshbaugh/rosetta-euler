defmodule Euler do
  def prime_factors(n) do
    prime_factors(n, 2)
  end

  defp prime_factors(n, p) when n < (p * p) do
    [n]
  end

  defp prime_factors(n, p) when rem(n, p) == 0 do
    [p | prime_factors(div(n, p), p)]
  end

  defp prime_factors(n, p) do
    prime_factors(n, p + 1)
  end
end

IO.puts Euler.prime_factors(600851475143)
|> :lists.max
|> to_string
