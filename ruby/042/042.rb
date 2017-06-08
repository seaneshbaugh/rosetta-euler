class Array
  def append_until(&block)
    self.each do
      result = block.yield(self)

      self << result if result
    end
  end
end

contents = File.read(File.expand_path(File.join(__dir__, '..', '..', 'files', 'words.txt')))

words = contents.split(',').map { |name| name.gsub('"', '') }.sort

word_values = words.map { |word| word.upcase.codepoints.map { |letter| letter - 64 }.inject(:+) }

max = word_values.max

triangle_numbers = [1].append_until { |t| (((t.length + 1) * (t.length + 2)) / 2) if (((t.length + 1) * (t.length + 2)) / 2) < max }

puts word_values.select { |word_value| triangle_numbers.include?(word_value) }.length
