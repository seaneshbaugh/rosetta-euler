def spiral_corners(length_of_side)
  raise ArgumentError unless length_of_side.integer? && length_of_side > 0

  last = length_of_side ** 2

  [last, last - (length_of_side - 1), last - ((length_of_side - 1) * 2), last - ((length_of_side - 1) * 3)]
end

puts (1..1001).step(2).map { |length_of_side| spiral_corners(length_of_side) }.flatten.uniq.inject(:+)
