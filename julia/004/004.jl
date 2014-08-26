println(maximum(filter(x -> string(x) == reverse(string(x)), reduce(vcat, [], map(x -> map(y -> x * y, 100:999), 100:999)))))
