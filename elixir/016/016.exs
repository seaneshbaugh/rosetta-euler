IO.puts :math.pow(2, 1000) |> round |> integer_to_list |> String.from_char_list! |> String.codepoints |> Enum.map(&(String.to_integer(&1) |> elem(0))) |> Enum.reduce(0, &(&1 + &2))
