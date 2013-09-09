IO.puts 1..999
|> Enum.filter(fn x -> rem(x, 3) == 0 || rem(x, 5) == 0 end)
|> Enum.reduce(0, &(&1 + &2))
|> to_string
