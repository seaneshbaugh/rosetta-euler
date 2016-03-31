defmodule Euler do
  def divide(a, b) when is_integer(a) and is_integer(b) and b != 0 do
    q = div(a, b)

    r = rem(a, b)

    seen = Dict.put(%{}, r, 0)

    digits = []

    divide(b, q, r, seen, digits)
  end

  defp divide(b, q, r, seen, digits) do
    r = r * 10

    digits = digits ++ [div(r, b)]

    r = rem(r, b)

    if Dict.has_key?(seen, r) do
      w = seen[r]

      [q, Enum.slice(digits, 0..(w - 1)), Enum.slice(digits, w..length(digits))]
    else
      divide(b, q, r, Dict.put(seen, r, length(digits)), digits)
    end
  end
end

IO.puts (2..999)
|> Enum.map(fn d -> [d, length(List.last(Euler.divide(1, d)))] end)
|> Enum.sort(fn a, b -> List.last(a) > List.last(b) end)
|> hd
|> hd
|> inspect
