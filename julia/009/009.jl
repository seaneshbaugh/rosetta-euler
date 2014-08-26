function pythagorean_triple_with_sum(sum)
  if sum < 11
    error("The smallest possible sum of a pythagorean triple is 11.")
  end

  ms = 2:(sum + 1)

  ns = 1:sum

  for m in ms
    for n in ns
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

println(prod(pythagorean_triple_with_sum(1000)))
