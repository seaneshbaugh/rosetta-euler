puts (100..999).to_a.map { |x| (100..999).to_a.map { |y| x * y } }.flatten.select { |x| x.to_s == x.to_s.reverse }.max
