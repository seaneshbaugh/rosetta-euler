let prime_factors n =
  let rec pf current possible_factor =
    if current < (possible_factor * possible_factor) then [current]
    elif current % possible_factor = 0I then possible_factor :: (pf (current / possible_factor) possible_factor)
    else pf current (possible_factor + 1I)
  pf n 2I

let rec remove_first i l =
  match l with
  | head :: tail when head = i -> tail
  | head :: tail -> head :: remove_first i tail
  | _ -> []

let overlap a b =
  let rec o a b =
    match a, b with
    | head :: tail, b -> o tail (remove_first head b)
    | a, [] -> a
    | [], b -> b
  List.append a (o a b) |> List.sort

printf "%A\n" ([1I..20I] |> List.map (fun x -> prime_factors x) |> List.reduce (fun a b -> overlap a b) |> List.reduce (fun a b -> a * b))
