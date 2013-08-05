IO.puts 1..999 |> Enum.filter(fn x -> rem(x, 3) == 0 || rem(x, 5) == 0 end) |> Enum.reduce(0, fn (x, sum) -> x + sum end)

# defmodule Euler do
#   def sum_of_multiples_of_three_and_five_less_than(x) when x <= 1, do: 0
#   def sum_of_multiples_of_three_and_five_less_than(x) when rem(x, 3) == 0 or rem(x, 5) == 0, do: x + sum_of_multiples_of_three_and_five_less_than(x - 1)
#   def sum_of_multiples_of_three_and_five_less_than(x), do: sum_of_multiples_of_three_and_five_less_than(x - 1)
# end
#
# defmodule Euler do
#   def sum_of_multiples_of_three_and_five_less_than(x) do
#     if x <= 1 do
#       0
#     else
#       if rem(x, 3) == 0 || rem(x, 5) == 0 do
#         x + sum_of_multiples_of_three_and_five_less_than(x - 1)
#       else
#         sum_of_multiples_of_three_and_five_less_than(x - 1)
#       end
#     end
#   end
# end
#
# IO.puts Euler.sum_of_multiples_of_three_and_five_less_than(999)
