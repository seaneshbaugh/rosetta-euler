lines = File.readlines(File.expand_path(File.join('..', '..', 'files', 'triangle.txt'), __dir__))

numbers = lines.map { |line| line.split(' ').map(&:to_i) }

maximum_path_sum = numbers.inject([0]) do |current_maxima, row|
  row.each_with_index.map do |number, index|
    if index == 0
      number + current_maxima[index]
    elsif index == row.length - 1
      number + current_maxima[index - 1]
    else
      [number + current_maxima[index - 1], number + current_maxima[index]].max
    end
  end
end.max

puts maximum_path_sum
