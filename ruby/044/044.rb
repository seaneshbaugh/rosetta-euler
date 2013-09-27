class Integer
  def pentagon
    (self * ((3 * self) - 1)) / 2
  end

  # def tpentagon
  #   ((27 * (self ** 2)) + (15 * self) + 2) / 2
  # end

  def pentagonal?
    n = ((Math.sqrt((24 * self) + 1) + 1) / 6)

    if n.floor == n
      n
    else
      false
    end
  end
end

pentagons = []

n = 1

loop do
  break if n > 1000000

  pentagons << n.pentagon

  n += 1
end

differences = []

pentagons.each do |j|
  pentagons.each do |k|
    if (j + k).pentagonal? && (j - k).abs.pentagonal?
      differences << (j - k).abs
    end
  end
end

puts differences.min







#
# (1..100).each do |n|
#   a = (3 * n) + 1
#
#   b = (n / 2) * ((9 * n) + 5)
#
#   c = ((9 * n * n) + (5 * n) + 2) / 2
#
#   puts [n, a, b, c, a.pentagon + b.pentagon, c.pentagon].inspect
#
#   d = (9 * n) + 3
#
#   e = ((3 * n) / 2) * ((27 * n) + 45)
#
#   f = ((27 * n * n) + (15 * n) + 2) / 2
#
#   puts [n, d, e, f, d.pentagon + e.pentagon, f.pentagon].inspect
# end
#
#
#
#
#
#
#
#
#
# class Array
#   def append_until(&block)
#     self.each do
#       result = block.yield(self)
#
#       self << result if result
#     end
#   end
# end
