class Integer
  def sum_of_nth_power_of_digits?(n)
    raise ArgumentError unless n.integer? && n > 0

    self.to_s.split(//).map { |digit| digit.to_i ** n }.inject(:+) == self
  end
end

n = 5

maximum = (9 ** n) * n

puts (10..maximum).select { |x| x.sum_of_nth_power_of_digits?(n) }.inject(:+)
