class Integer
  def greatest_common_divisor(other)
    if other == 0
      self
    else
      other.greatest_common_divisor(self % other)
    end
  end

  def square_root_as_continued_faction
    raise if self < 0

    a = []
    square_root_floor = Math.sqrt(self).floor
    b = square_root_floor
    c = 1

    a << square_root_floor

    return a if square_root_floor * square_root_floor == self

    loop do
      d = c
      c = self - b * b
      gcd = c.greatest_common_divisor(d)
      c /= gcd
      d /= gcd
      b *= -1
      limit = square_root_floor - c
      next_a = 0

      while b <= limit
        next_a += 1
        b += c
      end

      a << next_a

      return a if b == square_root_floor && c == 1
    end
  end
end

puts (1..10000).select { |n| (n.square_root_as_continued_faction.length - 1).odd? }.length
