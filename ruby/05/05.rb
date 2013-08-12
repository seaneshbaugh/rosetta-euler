class Fixnum
  def prime_factors
    v = (2..self - 1).detect { |i| self % i == 0 }

    v ? ([v] + (self / v).prime_factors) : [self]
  end
end

class Array
  def overlap(a)
    clone = self.clone

    a.each do |n|
      if clone.index(n)
        clone.delete_at(clone.index(n))
      end
    end

    (a + clone).sort
  end
end

prime_factor_lists = (1..20).to_a.map { |i| i.prime_factors }

factors = []

prime_factor_lists.each do |prime_factor_list|
  factors = factors.overlap(prime_factor_list)
end

puts factors.inject(:*)
