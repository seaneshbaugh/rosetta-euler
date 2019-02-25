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

result = nil

upper_limit_guess = 1000000

loop do
  primes = sieve_of_atkin(upper_limit_guess).map(&:to_s)

  primes_with_duplicate_digits = primes.select { |prime| prime.count('0') > 2 || prime.count('1') > 2 || prime.count('2') > 2 }

  primes_with_duplicate_digits.each do |prime|
    start = if prime.count('0') > 2
              0
            elsif prime.count('1') > 2
              1
            else
              2
            end

    n = 0

    (start..9).each do |digit|
      check = prime.gsub(start.to_s, digit.to_s)

      n += 1 if primes.include?(check)
    end

    next unless n >= 8

    result = prime

    break
  end

  break unless result.nil?

  upper_limit_guess *= 100
end

puts result
