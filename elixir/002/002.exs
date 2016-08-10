defmodule Euler do
  def fibs_less_than(n) do
    fibs_less_than(n, [1, 0])
  end

  defp fibs_less_than(n, [h | [a | _] = t]) when a + h < n do
    fibs_less_than(n, Enum.concat([a + h], [h | t]))
  end

  defp fibs_less_than(_, f) do
    f
  end
end

IO.puts Euler.fibs_less_than(4000000)
|> Enum.filter(fn x -> rem(x, 2) == 0 end)
|> Enum.reduce(0, &(&1 + &2))
|> to_string
