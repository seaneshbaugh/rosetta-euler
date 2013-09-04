def combos(n, c)
  if c.length < 1 || n < 0
    0
  elsif n == 0
    1
  else
    combos(n, c[0..-2]) + combos(n - c[-1], c)
  end
end

puts combos(200, [1, 2, 5, 10, 20, 50, 100, 200])
