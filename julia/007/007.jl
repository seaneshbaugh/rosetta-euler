function sieve_of_atkin(limit)
  primes = Int64[]

  sieve = falses(limit)

  square_root_of_limit = round(Int64, sqrt(limit))

  for x in 1:square_root_of_limit
    for y in 1:square_root_of_limit
      n = (4 * x * x) + (y * y)

      if n <= limit && (n % 12 == 1 || n % 12 == 5)
        sieve[n] = !sieve[n]
      end

      n = (3 * x * x) + (y * y)

      if n <= limit && n % 12 == 7
        sieve[n] = !sieve[n]
      end

      n = (3 * x * x) - (y * y)

      if x > y && n <= limit && n % 12 == 11
        sieve[n] = !sieve[n]
      end
    end
  end

  sieve[2] = true

  sieve[3] = true

  push!(primes, 2)

  push!(primes, 3)

  n = 5

  while n <= square_root_of_limit
    if sieve[n]
      i = n * n

      while i < limit
        sieve[i] = false

        i += n * n
      end

      push!(primes, n)
    end

    n += 2
  end

  while n < limit
    if sieve[n]
      push!(primes, n)
    end

    n += 2
  end

  primes
end

n = 10001

limit = round(Int64, (n * log(n)) + (n * (log(log(n)))))

println(sieve_of_atkin(limit)[n])
