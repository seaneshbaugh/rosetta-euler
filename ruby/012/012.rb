class Integer
  def prime_factors
    v = (2..self - 1).detect { |i| self % i == 0 }

    v ? ([v] + (self / v).prime_factors) : [self]
  end
end

n = 1

triangle_number = 1

loop do
  n += 1

  triangle_number = (1..n).inject(:+)

  number_of_divisors = triangle_number.prime_factors.group_by { |i| i }.map { |_k, v| v.length + 1 }.inject(:*)

  break unless number_of_divisors < 500
end

puts triangle_number
