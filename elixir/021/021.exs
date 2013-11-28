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

  def factors(n) do
    [primes | powers] = List.foldl(prime_factors(n), HashDict.new, fn (x, acc) -> HashDict.get(acc, x) && HashDict.put(acc, x, HashDict.get(acc, x) + 1) || HashDict.put(acc, x, 1) end)
    |> Enum.map(fn {k, v} -> [k, v] end)
    |> transpose

    powers = List.flatten(powers)

    exponents = Enum.map(powers, fn power -> 0..power |> Enum.to_list end)

    divisors = product(exponents) |> Enum.map(fn powers ->
      Enum.zip(primes, powers) |> Enum.map(fn {prime, power} -> trunc(:math.pow(prime, power)) end) |> Enum.reduce(fn x, y -> x * y end)
    end)

    divisors |> Enum.map(fn divisor -> [divisor, div(n, divisor)] end) |> Enum.sort
  end

  # Major thanks to ericmj for this:
  def product(list) do
    product(list, [])
  end

  defp product([], acc) do
    Enum.reverse acc
  end

  defp product([head | tail], acc) do
    result = Enum.map(head, fn element -> product(tail, [element | acc]) end)

    if tail == [] do
      result
    else
      Enum.concat result
    end
  end

  def proper_divisors(n) do
    factors(n) |> List.flatten |> Enum.uniq |> Enum.reject(fn factor -> factor == n end) |> Enum.sort
  end

  def transpose(m) do
    attach_row(m, [])
  end

  defp attach_row([], result) do
    reverse_rows(result, [])
  end

  defp attach_row(row_list, result) do
    [first_row | other_rows] = row_list

    new_result = make_column(first_row, result, [])

    attach_row(other_rows, new_result)
  end

  defp make_column([], _, new) do
    Enum.reverse(new)
  end

  defp make_column(row, [], accumulator) do
    [row_head | row_tail] = row

    make_column(row_tail, [], [[row_head] | accumulator])
  end

  defp make_column(row, result, accumulator) do
    [row_head | row_tail] = row

    [result_head | result_tail] = result

    make_column(row_tail, result_tail, [[row_head | result_head] | accumulator])
  end

  defp reverse_rows([], result) do
    Enum.reverse(result)
  end

  defp reverse_rows([first | others], result) do
    reverse_rows(others, [Enum.reverse(first) | result])
  end
end

sums_of_proper_divisors = (2..9999) |> Enum.map(fn i -> {i, Euler.proper_divisors(i) |> Enum.reduce(0, &(&1 + &2))} end)

amicable_numbers = sums_of_proper_divisors |> Enum.filter(fn {i, sum_of_proper_divisors} ->
  possible_amicable_number = Euler.proper_divisors(sum_of_proper_divisors) |> Enum.reduce(0, &(&1 + &2))

  possible_amicable_number == i && sum_of_proper_divisors != possible_amicable_number
end)

IO.puts amicable_numbers
|> Enum.map(fn {a, b} -> [a, b] end)
|> Enum.reduce([], &(&1 ++ &2))
|> Enum.uniq
|> Enum.reduce(0, &(&1 + &2))
|> to_string
