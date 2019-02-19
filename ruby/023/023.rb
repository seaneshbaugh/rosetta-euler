class Integer
  def prime_factors
    v = (2..self - 1).detect { |i| self % i == 0 }

    v ? ([v] + (self / v).prime_factors) : [self]
  end

  def factors
    primes, factor_powers = prime_factors.group_by { |i| i }.map { |k, v| [k, v.length] }.transpose

    exponents = factor_powers.map { |i| (0..i).to_a }

    divisors = exponents.shift.product(*exponents).map do |powers|
      primes.zip(powers).map { |prime, power| prime**power }.inject(:*)
    end

    divisors.sort.map { |divisor| [divisor, self / divisor] }
  end

  def proper_divisors
    factors.flatten.uniq.reject { |factor| factor == self }.sort
  end

  def abundant?
    self < proper_divisors.inject(:+)
  end
end

known_limit = 28123

abundant_numbers = (12..known_limit).select(&:abundant?)

puts (1..known_limit).select { |i| (abundant_numbers.map { |abundant_number| i - abundant_number if abundant_number < i }.compact & abundant_numbers).empty? }.inject(:+)
