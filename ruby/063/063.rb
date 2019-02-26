r = []

x = 1

loop do
  n = 1

  s = []

  loop do
    e = x**n

    d = e.digits.length

    break if d != n

    s << e

    n += 1
  end

  break if s.empty?

  r += s

  x += 1
end

puts r.length
