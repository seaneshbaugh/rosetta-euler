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

proc overlap(a: seq[int64], b: seq[int64]): seq[int64] =
  var c = a

  for i in b:
    let index = find(c, i)

    if index >= 0:
      delete(c, index)

  result = concat(c, b)

  return

var factors: seq[int64]

factors = @[]

for i in 1..20:
  factors = overlap(prime_factors(i), factors)

echo(foldr(factors, a * b))
