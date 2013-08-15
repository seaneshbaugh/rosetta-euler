def pythagorean_triple_with_sum(sum)
  if sum < 11
    raise ArgumentError, 'The smallest possible sum of a pythagorean triple is 11.'
  end

  ms = (2..sum).to_a

  ns = (1..(sum - 1)).to_a

  ms.each do |m|
    ns.each do |n|
      if m > n
        a = (m * m) - (n * n)

        b = 2 * m * n

        c = (m * m) + (n * n)

        if (a + b + c == sum) && ((a * a) + (b * b) == (c * c))
          return [a, b, c]
        end
      end
    end
  end

  return []
end

puts pythagorean_triple_with_sum(1000).inject(:*)
