require 'set'

class Integer
  def triangle
    (self * (self + 1)) / 2
  end

  def triangular?
    if self > 0
      n (Math.sqrt((8.0 * self) + 1.0) - 1.0) / 2.0

      if n.floor == n
        n
      else
        false
      end
    else
      false
    end
  end

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

  def hexagon
    self * ((2 * self) - 1)
  end

  def hexagonal?
    if self > 0
      n = (Math.sqrt((8.0 * self) + 1.0) + 1.0) / 4.0

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
