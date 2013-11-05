require 'set'

class Integer
  def triangle
    (self * (self + 1)) / 2
  end

  def pentagon
    (self * ((3 * self) - 1)) / 2
  end

  def hexagon
    self * ((2 * self) - 1)
  end
end

triangles = Set.new

pentagons = Set.new

hexagons = Set.new

index = 144

triangle = index.triangle

loop do
  triangles.add(triangle)

  pentagons.add(index.pentagon)

  hexagons.add(index.hexagon)

  break if pentagons.include?(triangle) && hexagons.include?(triangle)

  index += 1

  triangle = index.triangle
end

puts triangle
