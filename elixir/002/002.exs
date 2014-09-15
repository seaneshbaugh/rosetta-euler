defmodule Euler do
  def fibs_less_than(n) do
    fibs_less_than(n, [1, 0])
  end

  def fibs_less_than(n, [h | t]) do
    [a | _] = t

    if a + h < n do
      fibs_less_than(n, Enum.concat([a + h], [h | t]))
    else
      [h | t]
    end
  end
end

IO.puts Euler.fibs_less_than(4000000)
|> Enum.filter(fn x -> rem(x, 2) == 0 end)
|> Enum.reduce(0, &(&1 + &2))
|> to_string
