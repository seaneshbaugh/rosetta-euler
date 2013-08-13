println ((1..999).findAll { x -> x % 3 == 0 || x % 5 == 0 }.inject(0) { sum, x -> sum + x })
