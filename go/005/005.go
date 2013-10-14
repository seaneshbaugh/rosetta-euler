package main

import "fmt"

func main() {
	factorLists := make([][]uint64, 20)

	for i := range factorLists {
		factorLists[i] = primeFactors(uint64(i) + 1)
	}

	var factors []uint64

	for i := range factorLists {
		factors = overlap(factors, factorLists[i])
	}

	product := uint64(1)

	for i := range factors {
		product = product * factors[i]
	}

	fmt.Println(product)
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

func concat(a []uint64, b []uint64) []uint64 {
	c := make([]uint64, len(a)+len(b))

	copy(c[:len(a)], a)

	copy(c[len(a):], b)

	return c
}

func indexOf(a []uint64, n uint64) int {
	for p, v := range a {
		if v == n {
			return p
		}
	}

	return -1
}

func overlap(a []uint64, b []uint64) []uint64 {
	result := make([]uint64, len(a))

	copy(result, a)

	for i := range b {
		index := indexOf(result, b[i])

		if index != -1 {
			result = append(result[:index], result[index+1:]...)
		}
	}

	result = concat(result, b)

	return result
}
