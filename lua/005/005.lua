table.concat = function(t, u)
  table.foreach(u, function(i, v)
    table.insert(t, v)
  end)

  return t
end

table.reduce = function(t, f)
  local a

  for i, v in pairs(t) do
    if i == 1 then
      a = v
    else
      a = f(a, v)
    end
  end

  return a
end

table.find_first_where = function(t, f)
  for i, v in ipairs(t) do
    if f(v) then
      return i
    end
  end

  return nil
end

table.overlap = function(a, b)
  local a_copy = a

  for _, v in ipairs(b) do
    i = table.find_first_where(a_copy, function(x) return x == v end)

    if i  then
       table.remove(a_copy, i)
    end
  end

  local b_copy = b

  return table.concat(a_copy, b_copy)
end

function prime_factors(n)
  found = false

  v = 2

  i = 2

  while i < n - 1 and found == false do
    if n % i == 0 then
      found = true

      v = i
    end

    i = i + 1
  end

  if found then
    factors = table.concat({v}, prime_factors(math.floor(n / v)))
  else
    factors = {n}
  end

  return factors
end

factors = {}

for i = 1, 20, 1 do
  factors = table.overlap(factors, prime_factors(i))
end

print(table.reduce(factors, function(a, b) return a * b end))
