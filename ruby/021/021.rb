class Numeric
  def prime_factors
    v = (2..self - 1).detect { |i| self % i == 0 }

    v ? ([v] + (self / v).prime_factors) : [self]
  end

  def factors
    primes, powers = self.prime_factors.group_by { |i| i }.map { |k, v| [k, v.length] }.transpose

    exponents = powers.map { |i| (0..i).to_a }

    divisors = exponents.shift.product(*exponents).map do |powers|
      primes.zip(powers).map { |prime, power| prime ** power }.inject(:*)
    end

    divisors.sort.map { |divisor| [divisor, self / divisor] }
  end

  def proper_divisors
    self.factors.flatten.uniq.reject { |factor| factor == self }.sort
  end
end

sums_of_proper_divisors = {}

(2..9999).each do |i|
  sums_of_proper_divisors[i] = i.proper_divisors.inject(:+)
end

amicable_numbers = []

sums_of_proper_divisors.each do |value, sum_of_proper_divisors|
  possible_amicable_number = sum_of_proper_divisors.proper_divisors.inject(:+)

  if possible_amicable_number == value && sum_of_proper_divisors != possible_amicable_number
    amicable_numbers << [sum_of_proper_divisors, possible_amicable_number].sort
  end
end

puts amicable_numbers.flatten.uniq.inject(:+)
