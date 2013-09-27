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

puts 600851475143.prime_factors.max
