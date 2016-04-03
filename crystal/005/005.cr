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

class Array
  def overlap(a)
    clone = self.clone

    a.each do |n|
      index = clone.index(n)

      clone.delete_at(index.to_i64) if index
    end

    (a + clone).sort
  end
end

prime_factor_lists = (1..20).to_a.map { |i| i.to_i64.prime_factors }

factors = [] of Int64

prime_factor_lists.each do |prime_factor_list|
  factors = factors.overlap(prime_factor_list)
end

puts factors.reduce { |product, factor| product * factor }
