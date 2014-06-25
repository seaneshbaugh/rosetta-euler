lychrel_numbers = []

(0..9999).each do |n|
  i = 0

  x = n

  loop do
    if i >= 50
      lychrel_numbers << x

      break
    end

    x = x + x.to_s.reverse.to_i

    break if x.to_s == x.to_s.reverse

    i += 1
  end
end

puts lychrel_numbers.length
