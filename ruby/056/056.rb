puts (0..100).map { |a| (0..100).map { |b| (a**b).to_s.split('').map(&:to_i).inject(:+) } }.flatten.max
