defmodule Group do
  def group_by(collection, fun) do
    collection |> Enum.map(fn x -> { fun.(x), x } end) |>
    List.foldr(HashDict.new, fn ({k, v}, d) ->
      Dict.update(d, k, [v], fn([h | t]) ->
        List.concat([v], [h | t])
      end)
    end)
  end
end

defmodule Euler do
  def prime_factors(n) do
    _prime_factors(n, 2, [])
  end

  defp _prime_factors(1, _, factors) do
    factors
  end

  defp _prime_factors(n, k, factors) when rem(n, k) == 0 do
    _prime_factors(div(n, k), k, [k | factors])
  end

  defp _prime_factors(n, k, factors) do
    _prime_factors(n, k + 1, factors)
  end

  def find_triangle_number(divisor_limit) do
    _find_triangle_number(divisor_limit, 2)
  end

  def _find_triangle_number(divisor_limit, n) do
    triangle_number = 1..n |> Enum.reduce(0, &(&1 + &2))

    number_of_divisors = prime_factors(triangle_number) |> Group.group_by(&(&1)) |> Enum.map(fn({_, v}) -> length(v) + 1 end) |> Enum.reduce(1, &(&1 * &2))

    if number_of_divisors < 500 do
      _find_triangle_number(divisor_limit, n + 1)
    else
      triangle_number
    end
  end
end

IO.puts Euler.find_triangle_number(500)
