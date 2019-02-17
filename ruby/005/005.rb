class Integer
  def prime_factors
    v = (2..self - 1).detect { |i| self % i == 0 }

    v ? ([v] + (self / v).prime_factors) : [self]
  end
end

class Array
  def overlap(a)
    clone = self.clone

    a.each do |n|
      index = clone.index(n)

      clone.delete_at(index) if index
    end

    (a + clone).sort
  end
end

puts (1..20).map(&:prime_factors).inject([]) { |prime_factor_list, factors| factors.overlap(prime_factor_list) }.inject(:*)
