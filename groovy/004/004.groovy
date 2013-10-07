println ((100..999).collect { x -> (100..999).collect { y -> x * y } }.flatten().findAll { x -> x.toString() == x.toString().reverse() }.max())
