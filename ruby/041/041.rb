class Integer
  def prime?
    lower_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]

    return false if self < 2

    return true if lower_primes.include?(self)

    lower_primes.each do |lower_prime|
      return false if self % lower_prime == 0
    end

    upper_margin = Math.sqrt(self).to_i + 1

    current = 103

    loop do
      return false if self % current == 0

      current += 2

      break unless current < upper_margin
    end

    true
  end
end

puts (1..9).map { |x| (1..x).to_a.permutation.to_a.map { |pandigital| pandigital.join.to_i }.select(&:prime?) }.flatten.max
