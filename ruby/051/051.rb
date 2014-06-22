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

result = nil

upper_limit_guess = 1000000

loop do
  primes = sieve_of_atkin(upper_limit_guess).map { |prime| prime.to_s }

  primes_with_duplicate_digits = primes.select { |prime| prime.count('0') > 2 || prime.count('1') > 2 || prime.count('2') > 2}

  primes_with_duplicate_digits.each do |prime|
    if prime.count('0') > 2
      start = 0
    elsif prime.count('1') > 2
      start = 1
    else
      start = 2
    end

    n = 0

    (start..9).each do |digit|
      check = prime.gsub(start.to_s, digit.to_s)

      if primes.include?(check)
        n += 1
      end
    end

    if n >= 8
      result = prime

      break
    end
  end

  break unless result.nil?

  upper_limit_guess *= 100
end

puts result
