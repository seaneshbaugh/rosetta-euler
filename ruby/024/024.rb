class Array
  def nth_permutation(n)
    if n > (1..self.length).inject(:*)
      raise ArgumentError
    end

    if block_given?
      sorted = self.sort do |x, y|
        yield x, y
      end
    else
      sorted = self.sort
    end

    sorted_with_indices = {}

    sorted.each_with_index { |element, index| sorted_with_indices[index] = element }

    result = []

    while sorted_with_indices.length > 0
      m = 0

      if sorted_with_indices.length > 1
        f = (1..(sorted_with_indices.length - 1)).inject(:*)
      else
        f = 1
      end

      while m * f < n
        m += 1
      end

      m -= 1

      result << sorted_with_indices[m]

      sorted_with_indices.delete(m)

      n -= m * f

      remapped = sorted_with_indices.map { |k, v| v }

      sorted_with_indices = {}

      remapped.each_with_index { |element, index| sorted_with_indices[index] = element }
    end

    result
  end
end

digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

puts digits.nth_permutation(1000000).join
