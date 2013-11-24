IO.puts 1..100
|> Enum.reduce(1, &(&1 * &2))
|> to_string
|> String.codepoints
|> Enum.map(fn digit -> digit |> binary_to_integer end)
|> Enum.reduce(0, &(&1 + &2))
|> to_string
