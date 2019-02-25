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

number_of_primes = 3

side_length = 2

c = 9

loop do
  break if number_of_primes.to_f / ((2 * side_length) + 1).to_f < 0.1

  side_length += 2

  3.times do
    c += side_length

    number_of_primes += 1 if c.prime?
  end

  c += side_length
end

puts side_length + 1
