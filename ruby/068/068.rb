index_sets = [[0, 1, 2], [3, 2, 4], [5, 4, 6], [7, 6, 8], [9, 8, 1]]

rings = (1..10).to_a.permutation.select do |values|
  next unless values[index_sets[0][0]] < values[index_sets[1][0]] &&
              values[index_sets[0][0]] < values[index_sets[2][0]] &&
              values[index_sets[0][0]] < values[index_sets[3][0]] &&
              values[index_sets[0][0]] < values[index_sets[4][0]]

  sums = index_sets.map { |index_set| index_set.inject(0) { |memo, index| memo + values[index] } }

  sums.uniq.length == 1
end

puts rings.map { |ring| index_sets.flatten.each_with_object([]) { |index, memo| memo << ring[index] }.join }.select { |ring| ring.length == 16 }.max
