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

class Array
  def evenly_spaced?
    each_cons(2).to_a.map { |pair| (pair.first - pair.last).abs }.uniq.length == 1
  end
end

all_primes = sieve_of_atkin(10000)

primes.select! { |prime| prime.to_s.length == 4 }

groups = all_primes.group_by { |prime| prime.to_s.split('').sort }.select { |_digits, primes| primes.length >= 3 }

puts groups.map { |_digits, primes| primes.permutation(3).to_a.select { |p| p.sort.evenly_spaced? } }.map { |primes| primes.flatten.uniq }.uniq.reject(&:empty?).reject { |primes| primes.first == 1487 }.flatten.join
