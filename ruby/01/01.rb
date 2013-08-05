puts (1..999).select { |i| i % 3 == 0 || i % 5 == 0 }.inject(:+)
