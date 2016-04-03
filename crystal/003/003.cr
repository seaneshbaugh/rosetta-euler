struct Int
  def prime_factors
    n = self

    p = 2

    factors = [] of Int64

    loop do
      if n < p * p
        factors << n.to_i64

        break
      elsif n % p == 0
        n /= p

        factors << p.to_i64
      else
        p += 1
      end
    end

    factors
  end
end

puts 600851475143.prime_factors.max
