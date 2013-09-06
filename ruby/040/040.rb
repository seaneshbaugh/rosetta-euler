c = (1..1000000).to_a.join

digit_numbers = [1, 10, 100, 1000, 10000, 100000, 1000000]

puts digit_numbers.map { |digit| c[digit - 1].to_i }.inject(:*)
