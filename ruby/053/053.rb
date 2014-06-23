def combinatoric_selection(n, r)
  raise ArgumentError if r > n

  (1..n).inject(:*) / ((1..r).inject(:*) * (n -r > 0 ? (1..(n - r)) : [1]).inject(:*))
end

result = 0

(2..100).each do |n|
  (1..n).each do |r|
    result += 1 if combinatoric_selection(n, r) > 1_000_000
  end
end

puts result
