Number primeFactors := method(
  found := false

  v := 2

  i := 2

  while (i < self - 1 and found == false,
    if (self % i == 0,
      found = true

      v = i
    )

    i := i + 1
  )

  factors := list()

  if (found,
    factors append(v)

    factors appendSeq((self / v) primeFactors),
    factors append(self)
  )

  return factors
)

List max := method(
  m := self at(0)

  self foreach(i, v,
    if (v > m,
      m := v
    )
  )

 return m
)

write((600851475143 primeFactors) max)

write("\n")
