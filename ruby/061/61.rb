class Integer
  def triangle
    (self * (self + 1)) / 2
  end

  def square
    self * self
  end

  def pentagon
    (self * ((3 * self) - 1)) / 2
  end

  def hexagon
    self * ((2 * self) - 1)
  end

  def heptagon
    (self * ((5 * self) - 3)) / 2
  end

  def octagon
    self * ((3 * self) - 2)
  end
end

all_polygons = %i[triangle square pentagon hexagon heptagon octagon].map do |polygon_method|
  (1..).lazy.map(&polygon_method).drop_while { |o| o < 1000 }.take_while { |o| o < 10000 }.to_a
end

cycle_candidates = all_polygons.first.map { |polygon| [[0, polygon]] }

(all_polygons.length - 1).times do
  next_cycle_candidates = cycle_candidates.flat_map do |cycle_candidate|
    remaining_polygons = all_polygons.clone

    cycle_candidate.each { |index, _| remaining_polygons[index] = nil }

    next_start = cycle_candidate.last.last.digits.first(2)

    next_polygons_list = remaining_polygons.flat_map.with_index do |polygons, index|
      next if polygons.nil?

      next_polygons = polygons.select do |polygon|
        start = polygon.digits.last(2)

        start == next_start
      end

      next_polygons.map { |polygon| [index, polygon] }
    end

    next_polygons_list
      .reject { |next_polygon| next_polygon.nil? || next_polygon.empty? }
      .map { |next_polygon| cycle_candidate.clone << next_polygon }
  end

  cycle_candidates = next_cycle_candidates
end

cycle = cycle_candidates.select { |cycle_candidate| cycle_candidate.first.last.digits.last(2) == cycle_candidate.last.last.digits.first(2) }.first

puts cycle.map(&:last).inject(:+)
