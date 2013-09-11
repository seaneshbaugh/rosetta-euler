table.filter = function(t, f)
  local n = {}

  for i, v in pairs(t) do
    if f(v) then
      n[i] = v
    end
  end

  return n
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

fibs = { 0, 1 }

while fibs[table.getn(fibs)] + fibs[table.getn(fibs) - 1] < 4000000 do
  table.insert(fibs, fibs[table.getn(fibs)] + fibs[table.getn(fibs) - 1])
end

print(table.reduce(table.filter(fibs, function(x) return x % 2 == 0 end), function(a, b) return a + b end))
