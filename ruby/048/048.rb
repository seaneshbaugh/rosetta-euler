puts (1..1000).map { |x| x ** x }.inject(:+).to_s.slice(-10, 10)
