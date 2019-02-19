puts (2..100).map { |a| (2..100).map { |b| a**b } }.flatten.uniq.length
