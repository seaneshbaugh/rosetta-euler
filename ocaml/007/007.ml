let rec range i j s = if i > j then [] else i :: (range (i + s) j s)

let sieve_of_eratosthenes limit =
  let rec sieve prime limit primes integers =
    match prime with
    | prime when prime > limit -> List.sort compare (prime::primes @ integers)
    | _ ->
      let filtered = List.filter (fun x -> (x mod prime) <> 0) integers in
      match filtered with
      | [] -> raise(Invalid_argument "unexpected empty list")
      | newPrime::newIntegers -> sieve newPrime limit (prime::primes) newIntegers
  in
  sieve 2 (int_of_float (ceil (sqrt (float_of_int limit)))) [] (range 3 limit 2)
;;

let n = 10001 in
let limit = int_of_float (ceil ((log (float_of_int n)) *. (float_of_int n)) +. ((log (log (float_of_int n))) *. (float_of_int n))) in
Printf.printf "%d\n" (List.nth (sieve_of_eratosthenes limit) (n - 1))
