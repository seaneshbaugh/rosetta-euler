identities = (2..99).map { |x| ((x > 9 ? 123 : 1234)..(10000 / x)).map { |y| { x: x, y: y, p: x * y } } }.flatten(1)

pandigital_identities = identities.select{ |i| [i[:x], i[:y], i[:p]].join.split(//).sort.join == '123456789' }

unique_pandigital_identities = pandigital_identities.uniq{ |i| i[:p] }

puts unique_pandigital_identities.map { |i| i[:p] }.inject(:+)
