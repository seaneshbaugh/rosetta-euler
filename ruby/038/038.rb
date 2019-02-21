pandigitals = []

(1..9999).each do |x|
  d = [1, 2]

  y = 2

  p = []

  while p.length < 9
    p = d.map { |e| x * e }

    pandigitals << p.join.to_i if p.join.split('').sort.join == '123456789'

    y += 1

    d << y
  end
end

puts pandigitals.max
