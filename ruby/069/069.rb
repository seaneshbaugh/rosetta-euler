class Integer
  def prime_factors
    n = self

    p = 2

    factors = []

    loop do
      if n < p * p
        factors << n

        break
      elsif n % p == 0
        n /= p

        factors << p
      else
        p += 1
      end
    end

    factors
  end
end


# def sieve_of_atkin(limit)
#   primes = []

#   sieve = Array.new(limit + 1) { false }

#   square_root_of_limit = Math.sqrt(limit).to_i

#   (1..square_root_of_limit).each do |x|
#     (1..square_root_of_limit).each do |y|
#       n = (4 * x * x) + (y * y)

#       sieve[n] = !sieve[n] if n <= limit && (n % 12 == 1 || n % 12 == 5)

#       n = (3 * x * x) + (y * y)

#       sieve[n] = !sieve[n] if n <= limit && n % 12 == 7

#       n = (3 * x * x) - (y * y)

#       sieve[n] = !sieve[n] if x > y && n <= limit && n % 12 == 11
#     end
#   end

#   sieve[2] = true

#   sieve[3] = true

#   primes << 2

#   primes << 3

#   n = 5

#   while n <= square_root_of_limit
#     if sieve[n]
#       i = n * n

#       while i < limit
#         sieve[i] = false

#         i += n * n
#       end

#       primes << n
#     end

#     n += 2
#   end

#   while n < limit
#     primes << n if sieve[n]

#     n += 2
#   end

#   primes
# end

# puts sieve_of_atkin(1_000_000).length.inspect


class Integer
  # def relative_primes
  #   (1..(self - 1)).select { |i| self.gcd(i) == 1 }
  # end

  # def phi
  #   self.relative_primes.length
  # end

  def phi
    self.prime_factors.uniq.map { |p| Rational(1, 1) - Rational(1, p) } #.inject(:*)
  end
end

puts (2..10).map(&:phi).inspect

# puts (2..100).map { |i| Rational(i, 1) * i.prime_factors.map { |f| Rational(1, 1) - Rational(1, f) }.inject(:*) }.map(&:to_i).inspect

#puts (990..1000).map { |i| i.prime_factors }.inspect
