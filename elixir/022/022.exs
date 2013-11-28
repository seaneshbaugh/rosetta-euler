{:ok, contents} = File.read("../../files/names.txt")

names = contents |> String.split(",") |> Enum.map(fn name -> name |> String.replace("\"", "") end) |> Enum.sort

scores = names |> Enum.with_index |> Enum.map(fn {name, index} -> (name |> String.to_char_list! |> Enum.map(fn letter -> letter - 64 end) |> Enum.reduce(0, &(&1 + &2))) * (index + 1) end)

IO.puts scores
|> Enum.reduce(0, &(&1 + &2))
|> to_string
