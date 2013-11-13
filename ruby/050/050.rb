def sieve_of_atkin(limit)
  primes = []

  sieve = Array.new(limit) { false }

  square_root_of_limit = Math.sqrt(limit).to_i

  (1..square_root_of_limit).each do |x|
    (1..square_root_of_limit).each do |y|
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

  primes << 2

  primes << 3

  n = 5

  while n <= square_root_of_limit do
    if sieve[n]
      i = n * n

      while i < limit do
        sieve[i] = false

        i += n * n
      end

      primes << n
    end

    n += 2
  end

  while n < limit do
    if sieve[n]
      primes << n
    end

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

    if primes.include?(sum)
      prime = sum

      break
    end
  end

  break if prime

  length -= 1
end

puts prime
