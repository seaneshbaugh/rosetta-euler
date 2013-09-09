defmodule Euler do
  def binomial_coefficient(top, bottom) when is_integer(top) and is_integer(bottom) and (top - bottom + 1) < top and bottom > 2 do
    div(((top - bottom + 1)..top) |> Enum.reduce(1, fn (x, product) -> x * product end), (2..bottom) |> Enum.reduce(1, fn (x, product) -> x * product end))
  end

  def lattice_paths(m, n) when m <= n do
    binomial_coefficient(m + n, n)
  end

  def lattice_paths(m, n) do
    binomial_coefficient(m + n, m)
  end
end

IO.puts Euler.lattice_paths(20, 20) |> to_string
