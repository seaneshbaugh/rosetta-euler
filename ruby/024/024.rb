class Array
  def nth_permutation(n)
    raise ArgumentError if n > (1..length).inject(:*)

    sorted = if block_given?
               sort do |x, y|
                 yield x, y
               end
             else
               sort
             end

    sorted_with_indices = sorted.map.with_index { |element, index| [index, element] }.to_h

    result = []

    until sorted_with_indices.empty?
      m = 0

      f = if sorted_with_indices.length > 1
            (1..(sorted_with_indices.length - 1)).inject(:*)
          else
            1
          end

      m += 1 while m * f < n

      m -= 1

      result << sorted_with_indices[m]

      sorted_with_indices.delete(m)

      n -= m * f

      sorted_with_indices = sorted_with_indices.values.map.with_index { |element, index| [index, element] }.to_h
    end

    result
  end
end

digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

puts digits.nth_permutation(1000000).join
