x = 2

loop do
  break if [2, 3, 4, 5, 6].map { |n| (x * n).to_s.split('').uniq.sort }.uniq.length == 1

  x += 1
end

puts x
