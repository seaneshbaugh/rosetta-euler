function prime_factors(n)
  found = false

  v = 2

  i = 2

  while i < n - 1 && !found
    if mod(n, i) == 0
      found = true

      v = i
    end

    i += 1
  end

  if found
    factors = vcat([v], prime_factors(div(n, v)))
  else
    factors = [n]
  end

  factors
end

println(maximum(prime_factors(600851475143)))
