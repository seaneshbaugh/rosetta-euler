IO.puts trunc(:math.pow((1..100 |> Enum.reduce(0, fn (x, sum) -> x + sum end)), 2) - (1..100 |> Enum.reduce(0, fn(x, sum) -> :math.pow(x, 2) + sum end))) |> to_string
