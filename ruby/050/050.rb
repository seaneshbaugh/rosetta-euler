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

primes = sieve_of_atkin(1000000)

reasonable_upper_limit = 1

loop do
  break if primes.slice(0, reasonable_upper_limit).inject(:+) > 1000000

  reasonable_upper_limit += 1
end

searchable_primes = primes.slice(0, reasonable_upper_limit)

prime = nil

length = searchable_primes.length

loop do
  break if length == 0

  searchable_primes.each_cons(length).to_a.each do |consecutives|
    sum = consecutives.to_a.inject(:+)

    next unless primes.include?(sum)

    prime = sum

    break
  end

  break if prime

  length -= 1
end

puts prime
