let range = (1...999).map({ $0 })

let filtered = range.filter({ $0 % 3 == 0 || $0 % 5 == 0 })

print(filtered.reduce(0, +))
