class Integer
  def triangle
    (self * (self + 1)) / 2
  end
end

contents = File.read(File.expand_path(File.join(__dir__, '..', '..', 'files', 'words.txt')))

words = contents.split(',').map { |name| name.delete('"') }.sort

word_values = words.map { |word| word.upcase.codepoints.map { |letter| letter - 64 }.inject(:+) }

max = word_values.max

triangle_numbers = (1..).lazy.map(&:triangle).take_while { |t| t < max }.to_a

puts word_values.select { |word_value| triangle_numbers.include?(word_value) }.length
