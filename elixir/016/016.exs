IO.puts :math.pow(2, 1000)
|> round
|> Integer.to_string
|> String.codepoints
|> Enum.map(&(String.to_integer(&1)))
|> Enum.reduce(0, &(&1 + &2))
|> to_string
