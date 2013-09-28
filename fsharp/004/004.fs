open System
open System.Globalization

type String with
  member self.Reverse() =
    StringInfo.ParseCombiningCharacters(self)
    |> Seq.map (fun i -> StringInfo.GetNextTextElement(self, i))
    |> Seq.fold (fun acc s -> s + acc ) ""

printf "%A\n" ([100..999]
  |> List.map(fun x -> [100..999] |> List.map(fun y -> x * y))
  |> List.concat
  |> List.filter (fun x -> Convert.ToString(x) = Convert.ToString(x).Reverse())
  |> List.max)
