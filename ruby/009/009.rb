def pythagorean_triple_with_sum(sum)
  raise ArgumentError, 'The smallest possible sum of a pythagorean triple is 11.' if sum < 11

  (2..sum).each do |m|
    (1..(sum - 1)).each do |n|
      next unless m > n

      a = (m * m) - (n * n)

      b = 2 * m * n

      c = (m * m) + (n * n)

      return [a, b, c] if (a + b + c == sum) && ((a * a) + (b * b) == (c * c))
    end
  end

  []
end

puts pythagorean_triple_with_sum(1000).inject(:*)
