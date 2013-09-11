let fibs_less_than x =
  let rec f l =
    match l with
    | head :: tail when (head + (List.head tail)) < x -> (f ([head + (List.head tail)] @ l))
    | _ :: _ -> l
    | [] -> (f [ 1; 0 ])
  f [ 1; 0 ]

printf "%A\n" (fibs_less_than(4000000) |> List.filter (fun x -> x % 2 = 0) |> List.sum)
