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

class Integer

  def phi
    self.prime_factors.tally.to_a.inject(1) { |r, (factor, count)| r *= (factor - 1) * factor**(count - 1) }
  end
end

puts (2..1_000_000).map { |n| phi = n.phi; { n: n, phi: phi, n_over_phi: n.to_f / phi.to_f } }.max_by { |r| r[:n_over_phi] }[:n]
