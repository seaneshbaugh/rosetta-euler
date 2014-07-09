class Integer
  def prime?
    lower_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]

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

  def goldbach?
    i = 1

    loop do
      s = 2 * i * i

      break if s >= self

      return true if (self - s).prime?

      i += 1
    end

    false
  end
end

i = 3

loop do
  unless i.prime?
    break unless i.goldbach?
  end

  i += 2
end

puts i
