println((1...999).map({ $0 }).filter({ $0 % 3 == 0 || $0 % 5 == 0 }).reduce(0, combine:+))
