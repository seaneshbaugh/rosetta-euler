class Integer
  def closest_square
    raise 'only valid on integers greater than or equal to 0' if self < 0

    floor = Math.sqrt(self).floor
    ceil = floor + 1
    floor_square = floor * floor
    ceil_square = ceil * ceil
    floor_distance = self - floor_square
    ceil_distance = ceil_square - self

    if floor_distance < ceil_distance
      floor_square
    else
      ceil_square
    end
  end
end

squares = (1..).lazy.map { |i| i * i }.take_while { |is| is <= 1000 }.to_a

ds = (1..1000).to_a - squares

xs = ds.map do |d|
  y = 1

  x = Math.sqrt(d.closest_square).to_i

  k = (x * x) - d * y * y

  loop do
    break if k == 1

    i = 0

    loop do
      break if (x + y * i) % k == 0

      i += 1
    end

    t = 0

    m = k.abs * t + i

    previous_n = Float::INFINITY
    previous_m = nil

    loop do
      n = (m * m - d).abs

      break if n > previous_n

      previous_n = n

      t += 1

      previous_m = m

      m = k.abs * t + i
    end

    m = previous_m

    x2 = (x * m + d * y) / k.abs
    y2 = (x + y * m) / k.abs
    k2 = (m * m - d) / k

    x = x2
    y = y2
    k = k2
  end

  [d, x]
end

puts xs.max_by(&:last).first
