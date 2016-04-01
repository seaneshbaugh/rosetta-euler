class Integer
  def prime?
    if !self.integer?
      false
    else
      lower_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]

      if lower_primes.include?(self)
        return true
      end

      lower_primes.each do |lower_prime|
        if self % lower_prime == 0
          return false
        end
      end

      upper_margin = Math.sqrt(self).to_i + 1

      current = 101

      begin
        if self % current == 0
          return false
        end

        current += 2
      end while current < upper_margin

      true
    end
  end

  def circular_prime?
    if self.prime?
      digits = self.to_s.split('')

      (digits.length - 1).times do
        digits = digits.rotate

        return false unless digits.join.to_i.prime?
      end

      true
    else
      false
    end
  end
end

def sieve_of_atkin(limit)
  primes = []

  sieve = Array.new(limit + 1) { false }

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

puts sieve_of_atkin(1000000).select { |x| x.circular_prime? }.length
