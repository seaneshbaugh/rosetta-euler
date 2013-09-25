let prime_factors n =
  let rec pf current possible_factor =
    if current < (possible_factor * possible_factor) then [current]
    elif current % possible_factor = 0I then possible_factor :: (pf (current / possible_factor) possible_factor)
    else pf current (possible_factor + 1I)
  pf n 2I

printf "%A\n" ((prime_factors 600851475143I) |> List.max)
