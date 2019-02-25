cube_digits = {}

i = 0

result = nil

loop do
  i += 1

  cube = i * i * i

  digits = cube.digits.sort

  cube_digits[digits] ||= []

  cube_digits[digits] << cube

  next unless cube_digits[digits].length == 5

  max = digits.reverse.join('').to_i

  max_cube_root = (max**(1.0 / 3.0)).ceil

  more = false

  ((i + 1)..max_cube_root).each do |j|
    next_cube = j * j * j

    next unless next_cube.digits.sort == digits

    more = next_cube

    break
  end

  next if more

  result = cube_digits[digits].min

  break
end

puts result
