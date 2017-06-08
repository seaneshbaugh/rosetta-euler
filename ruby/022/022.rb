contents = File.read(File.expand_path(File.join(__dir__, '..', '..', 'files', 'names.txt')))

names = contents.split(',').map { |name| name.gsub('"', '') }.sort

scores = names.map.with_index { |name, index| name.each_byte.map { |letter| letter - 64 }.inject(:+) * (index + 1) }

puts scores.inject(:+)
