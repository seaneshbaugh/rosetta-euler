class Integer
  def prime?
    lower_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]

    return false if self < 2

    return true if lower_primes.include?(self)

    lower_primes.each do |lower_prime|
      return false if self % lower_prime == 0
    end

    upper_margin = Math.sqrt(self).to_i + 1

    current = 103

    loop do
      return false if self % current == 0

      current += 2

      break unless current < upper_margin
    end

    true
  end

  def truncatable_prime?
    if prime?
      digits = to_s.split('')

      (digits.length - 1).times do
        digits = digits[0..-2]

        return false unless digits.join.to_i.prime?
      end

      digits = to_s.split('')

      (digits.length - 1).times do
        digits = digits[1..digits.length]

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

puts sieve_of_atkin(799997).select { |x| x > 10 && x.truncatable_prime? }.inject(:+)
