defmodule Euler do
  def fibs_with_at_most_n_digits(n) do
    fibs_with_at_most_n_digits(n, [1, 0])
  end

  defp fibs_with_at_most_n_digits(n, [h | t]) do
    [a | _] = t

    if (a + h) |> to_string |> String.length < n do
      fibs_with_at_most_n_digits(n, Enum.concat([a + h], [h | t]))
    else
      [h | t]
    end
  end
end

IO.puts Euler.fibs_with_at_most_n_digits(1000)
|> length
|> to_string
