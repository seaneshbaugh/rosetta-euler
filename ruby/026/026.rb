def divide(a, b)
  raise ArgumentError unless a.integer? && b.integer?

  raise ZeroDivisionError if b == 0

  q = a / b

  r = a % b

  seen = {}

  seen[r] = 0

  digits = []

  loop do
    r *= 10

    digits << r / b

    r = r % b

    if seen.key?(r)
      w = seen[r]

      return [q, digits[0..(w - 1)], digits[w..(digits.length)]]
    else
      seen[r] = digits.length
    end
  end
end

puts (2..999).map { |d| [d, divide(1, d)[2].length] }.max_by { |x| x[1] }[0]
