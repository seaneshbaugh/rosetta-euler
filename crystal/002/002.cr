fibonacci_numbers = [0, 1]

loop do
  break if fibonacci_numbers[-1] + fibonacci_numbers[-2] > 4000000

  fibonacci_numbers << fibonacci_numbers[-1] + fibonacci_numbers[-2]
end

puts fibonacci_numbers.select { |n| n.even? }.reduce { |sum, i| sum + i }
