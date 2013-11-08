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

class Array
  def evenly_spaced?
    self.each_cons(2).to_a.map { |pair| (pair.first - pair.last).abs }.uniq.length == 1
  end
end

primes = sieve_of_atkin(10000)

primes.reject! { |prime| prime.to_s.length != 4 }

groups = primes.group_by { |prime| prime.to_s.split('').sort }.select { |digits, primes| primes.length >=3 }

puts groups.map { |digits, primes| primes.permutation(3).to_a.select { |primes| primes.sort.evenly_spaced? } }.map { |primes| primes.flatten.uniq }.uniq.reject { |primes| primes.empty? }.reject { |primes| primes.first == 1487 }.flatten.join
