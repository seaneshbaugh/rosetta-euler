table.concat = function(t, u)
  table.foreach(u, function(i, v)
    table.insert(t, v)
  end)

  return t
end

prime_factors = function(n)
  found = false

  v = 2

  i = 2

  while i < n - 1 and found == false do
    if n % i == 0 then
      found = true

      v = i
    end

    i = i + 1
  end

  if found then
    factors = table.concat({v}, prime_factors(math.floor(n / v)))
  else
    factors = {n}
  end

  return factors
end

print(math.max(unpack(prime_factors(600851475143))))
