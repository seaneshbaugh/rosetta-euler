from sequtils import `concat`, `foldr`

proc prime_factors(n: int64): seq[int64] =
  var found = false

  var v = 2

  var i = 2

  while i < n - 1 and found == false:
    if n mod i == 0:
      found = true

      v = i

    i = i + 1

  result = @[]

  if found:
    add(result, v)

    result = concat(result, prime_factors(n div v))
  else:
    add(result, n)

  return

echo(foldr(prime_factors(600851475143), max(a, b)))
