fibs = [0, 1]

while (fibs[fibs.size() - 1] + fibs[fibs.size() - 2] < 4000000) {
    fibs.add(fibs[fibs.size() - 1] + fibs[fibs.size() - 2])
}

println (fibs.findAll { x -> x % 2 == 0 }.inject(0) { sum, x -> sum + x })
