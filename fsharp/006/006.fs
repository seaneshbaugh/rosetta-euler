printf "%A\n" ((([1I..100I] |> List.reduce (fun a b -> a + b)) ** 2) - ([1I..100I] |> List.map (fun x -> x ** 2) |> List.reduce (fun a b -> a + b)))
