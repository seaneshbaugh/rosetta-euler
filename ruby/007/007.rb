def sieve_of_atkin(limit)
  primes = []

  sieve = Array.new(limit + 1) { false }

  square_root_of_limit = Math.sqrt(limit).to_i

  (1..square_root_of_limit).each do |x|
    (1..square_root_of_limit).each do |y|
      n = (4 * x * x) + (y * y)

      sieve[n] = !sieve[n] if n <= limit && (n % 12 == 1 || n % 12 == 5)

      n = (3 * x * x) + (y * y)

      sieve[n] = !sieve[n] if n <= limit && n % 12 == 7

      n = (3 * x * x) - (y * y)

      sieve[n] = !sieve[n] if x > y && n <= limit && n % 12 == 11
    end
  end

  sieve[2] = true

  sieve[3] = true

  primes << 2

  primes << 3

  n = 5

  while n <= square_root_of_limit
    if sieve[n]
      i = n * n

      while i < limit
        sieve[i] = false

        i += n * n
      end

      primes << n
    end

    n += 2
  end

  while n < limit
    primes << n if sieve[n]

    n += 2
  end

  primes
end

n = 10001

limit = ((n * Math.log(n)) + (n * Math.log(Math.log(n)))).to_i

puts sieve_of_atkin(limit)[n - 1]
