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

i = 647

consecutives = []

loop do
  prime_factors = i.prime_factors

  if prime_factors.length == 4 && prime_factors.length == prime_factors.uniq.length
    consecutives << i
  else
    consecutives = []
  end

  break if consecutives.length == 4

  i += 1
end

puts consecutives.first
