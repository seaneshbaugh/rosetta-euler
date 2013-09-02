package main

import "fmt"

func main() {
	factors := primeFactors(600851475143)

	fmt.Println(factors[len(factors)-1])
}

func primeFactors(x uint64) []uint64 {
	var found bool = false

	var v uint64 = 2

	var i uint64

	for i = 2; i < x-1; i++ {
		if x%i == 0 {
			found = true

			v = i

			break
		}
	}

	var result []uint64

	if found {
		result = append(result, v)

		moreFactors := primeFactors(x / v)

		result = concat(result, moreFactors)
	} else {
		result = append(result, x)
	}

	return result
}

func concat(a, b []uint64) []uint64 {
	c := make([]uint64, len(a)+len(b))

	copy(c[:len(a)], a)

	copy(c[len(a):], b)

	return c
}
