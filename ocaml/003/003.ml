let prime_factors n =
  let rec pf c p =
    match c with
    | c when c < (p * p) -> [c]
    | c when (c mod p) = 0 -> [p] @ (pf (c / p) p)
    | _ -> pf c (p + 1)
  in
  pf n 2;;

let factors = prime_factors 600851475143;;

Printf.printf "%d\n" (List.fold_left max 0 factors)
