require 'set'

class Integer
  def pentagon
    (self * ((3 * self) - 1)) / 2
  end

  def pentagonal?
    if self > 0
      n = (Math.sqrt((24.0 * self) + 1.0) + 1.0) / 6.0

      if n.floor == n
        n
      else
        false
      end
    else
      false
    end
  end
end

pentagons = Set.new

differences = []

minimal_difference = 0

pentagon = 0

pentagon_index = 1

loop do
  previous_pentagon = pentagon

  pentagon = pentagon_index.pentagon

  delta = pentagon - previous_pentagon

  if !differences.empty? && differences.first < delta
    differences.delete_at(0)
  end

  break if minimal_difference != 0 && differences.empty?

  differences.each do |difference|
    if pentagons.include?(pentagon - difference) && ((2 * pentagon) - difference).pentagonal?
      minimal_difference = difference

      while differences.last >= minimal_difference
        differences.pop
      end

      break
    end
  end

  pentagons.add(pentagon)

  if minimal_difference == 0
    differences << pentagon
  end

  pentagon_index += 1
end

puts minimal_difference
