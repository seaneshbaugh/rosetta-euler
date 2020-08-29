function prime_factors(n)
  found = false

  v = 2

  i = 2

  while i < n - 1 && !found
    if mod(n, i) == 0
      found = true

      v = i
    end

    i += 1
  end

  if found
    factors = vcat([v], prime_factors(div(n, v)))
  else
    factors = [n]
  end

  factors
end

function remove_first(item, collection)
  index = findfirst(x -> x == item, collection)

  if index != nothing
    deleteat!(collection, index)
  else
    collection
  end
end

function overlap(a, b)
  a_copy = a

  for n in b
    a_copy = remove_first(n, a_copy)
  end

  sort(vcat(a_copy, b))
end

println(prod(reduce(overlap, map(i -> prime_factors(i), 1:20); init=[1])))
