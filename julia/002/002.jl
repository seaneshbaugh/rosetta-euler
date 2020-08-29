fibs = [0, 1]

while fibs[length(fibs)] + fibs[length(fibs) - 1] < 4000000
    append!(fibs, [fibs[length(fibs)] + fibs[length(fibs) - 1]])
end

println(sum(filter(x -> mod(x, 2) == 0, fibs)))
