pandigitals = []

x = 1

while x < 10000
  d = [1, 2]

  y = 2

  p = []

  while p.join.length < 9
    p = d.map { |d| x * d }

    if p.join.split('').sort.join == '123456789'
      pandigitals << p.join.to_i
    end

    y += 1

    d << y
  end

  x += 1
end

puts pandigitals.max
