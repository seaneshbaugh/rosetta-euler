defmodule Euler do
  def nth_permutation(list, n) do
    nth_permutation(list |> Enum.sort |> Enum.with_index, [], n)
  end

  defp nth_permutation([_ | _] = list, current, max) do
    f = cond do
      length(list) > 1 -> (1..(length(list) - 1)) |> Enum.reduce(1, &(&1 * &2))
      true -> 1
    end

    index = get_index(0, f, max)

    result = current ++ [elem(:lists.nth(index + 1, list), 0)]

    nth_permutation(Enum.map(List.delete_at(list, index), fn {v, _} -> v end) |> Enum.with_index, result, max - (index * f))
  end

  defp nth_permutation([], current, _) do
    current
  end

  defp get_index(m, f, max) when m * f < max do
    get_index(m + 1, f, max)
  end

  defp get_index(m, _, _) do
    m - 1
  end
end

IO.puts [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
|> Euler.nth_permutation(1000000)
|> Enum.map(&(to_string(&1)))
|> Enum.join
