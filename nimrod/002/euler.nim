from sequtils import `filter`
from math import `sum`

var fibs = @[0, 1]

while fibs[fibs.len - 1] + fibs[fibs.len - 2] < 4000000:
  add(fibs, fibs[fibs.len - 1] + fibs[fibs.len - 2])

echo(sum(filter(fibs, proc(x: int): bool = x mod 2 == 0)))
