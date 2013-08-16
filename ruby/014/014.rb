def collatz(n)
  if n <= 1
    1
  elsif n.odd?
    (3 * n) + 1
  else
    n / 2
  end
end

chain_lengths = {}

(1..1000000).each do |start|
  length = 1

  n = start

  while n > 1
    n = collatz(n)

    length += 1
  end

  chain_lengths[start] = length
end

puts chain_lengths.sort_by { |start, length| length }.map{ |start, length| start}.last
