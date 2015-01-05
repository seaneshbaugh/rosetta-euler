from sequtils import `foldr`
from strutils import `intToStr`

var palindromes: seq[int]

palindromes = @[]

for x in 100..999:
  for y in 100..999:
    var product = x * y

    var s = intToStr(product)

    var r = ""

    for i in countdown(high(s), 0):
      r.add s[i]

    if s == r:
      add(palindromes, product)

echo(foldr(palindromes, max(a, b)))
