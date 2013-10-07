table.max = function(t)
  if #t == 0 then
    return nil
  end

  local m = t[1]

  for i = 2, #t do
    if t[i] > m then
      m = t[i]
    end
  end

  return m
end

palindromes = {}

for x = 100, 999, 1 do
  for y = 100, 999, 1 do
    product = x * y

    s = tostring(product)

    if s == string.reverse(s) then
      table.insert(palindromes, product)
    end
  end
end

print(table.max(palindromes))
