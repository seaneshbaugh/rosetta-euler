let rec sieve prime limit primes integers =
  if prime > limit then
    List.sort ((prime :: primes) @ integers)
  else
    let l = List.filter (fun x -> x % prime <> 0) integers
    let newPrime = List.head l
    let newIntegers = List.tail l
    sieve newPrime limit (prime :: primes) newIntegers

let sieveOfEratosthenes limit = sieve 2 (int (round (sqrt (float limit)))) [] [3..2..limit]

let n = 10001

let limit = int (round (((log (float n)) * (float n)) + ((log (log (float n))) * (float n))))

printf "%A\n" (List.nth (sieveOfEratosthenes limit) (n - 1))
