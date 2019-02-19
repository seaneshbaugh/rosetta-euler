class Integer
  def prime?
    lower_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]

    return false if self < 2

    return true if lower_primes.include?(self)

    lower_primes.each do |lower_prime|
      return false if self % lower_prime == 0
    end

    upper_margin = Math.sqrt(self).to_i + 1

    current = 101

    loop do
      return false if self % current == 0

      current += 2

      break unless current < upper_margin
    end

    true
  end
end

consecutive_primes = {}

(-999..999).each do |a|
  (-999..999).each do |b|
    n = 0

    loop do
      break unless ((n**2) + (a * n) + b).abs.prime?

      n += 1
    end

    consecutive_primes[[a, b]] = n
  end
end

max_consecutive_primes = consecutive_primes.max_by { |_k, v| v }

puts max_consecutive_primes.first[0] * max_consecutive_primes.first[1]
