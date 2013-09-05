class Integer
  def prime?
    lower_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

    if self < 2
      return false
    end

    if lower_primes.include?(self)
      return true
    end

    lower_primes.each do |lower_prime|
      if self % lower_prime == 0
        return false
      end
    end

    upper_margin = Math.sqrt(self).to_i + 1

    current = 101

    begin
      if self % current == 0
        return false
      end

      current += 2
    end while current < upper_margin

    true
  end
end

consecutive_primes = {}

(-999..999).each do |a|
  (-999..999).each do |b|
    n = 0

    while true
      if (((n ** 2) + (a * n) + b).abs).prime?
        n += 1
      else
        break
      end
    end

    consecutive_primes[[a, b]] = n
  end
end

max_consecutive_primes = consecutive_primes.sort_by { |k, v| v }.last

puts max_consecutive_primes.first[0] * max_consecutive_primes.first[1]
