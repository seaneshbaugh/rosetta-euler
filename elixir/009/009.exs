defmodule Euler do
  def pythagorean_triple_with_sum(sum) when sum > 11 do
    pythagorean_triple_with_sum(sum, 2, 1)
  end

  defp pythagorean_triple_with_sum(sum, m, n) when m < sum and n < sum - 1 and m > n do
    a = (m * m) - (n * n)

    b = 2 * m * n

    c = (m * m) + (n * n)

    if (a + b + c == sum) && ((a * a) + (b * b) == (c * c)) do
      [a, b, c]
    else
      pythagorean_triple_with_sum(sum, m, n + 1)
    end
  end

  defp pythagorean_triple_with_sum(sum, m, n) when m < sum and n < sum - 1 do
    pythagorean_triple_with_sum(sum, m + 1, 1)
  end

  defp pythagorean_triple_with_sum(_, _, _) do
    []
  end
end

IO.puts Euler.pythagorean_triple_with_sum(1000)
|> Enum.reduce(1, &(&1 * &2))
|> to_string
