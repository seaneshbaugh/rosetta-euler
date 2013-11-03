let rec range i j = if i > j then [] else i :: (range (i + 1) j)

let prime_factors n =
  let rec pf c p =
    match c with
    | c when c < (p * p) -> [c]
    | c when (c mod p) = 0 -> [p] @ (pf (c / p) p)
    | _ -> pf c (p + 1)
  in
  pf n 2

let rec remove_first i l =
  match l with
  | hd::tl when hd = i -> tl
  | hd::tl -> hd::(remove_first i tl)
  | _ -> []

let overlap a b =
  let rec o a b =
    match a, b with
    | hd::tl, b -> o tl (remove_first hd b)
    | a, [] -> a
    | [], b -> b
  in
  a @ (o a b);;

Printf.printf "%d\n" (List.fold_left (fun acc x -> x * acc) 1 (List.fold_left (fun acc x -> overlap acc x) [] (List.map (fun x -> prime_factors x) (range 1 20))))
