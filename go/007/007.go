package main

import "fmt"
import "math"

func sieveOfAtkin(limit uint64) []uint64 {
	var primes []uint64

	sieve := make([]bool, limit+1)

	var i uint64

	for i = 0; i < limit; i++ {
		sieve[i] = false
	}

	squareRootOfLimit := uint64(math.Sqrt(float64(limit)))

	var x uint64

	var y uint64

	var n uint64

	for x = 1; x <= squareRootOfLimit; x++ {
		for y = 1; y <= squareRootOfLimit; y++ {
			n := (4 * x * x) + (y * y)

			if n <= limit && (n%12 == 1 || n%12 == 5) {
				sieve[n] = !sieve[n]
			}

			n = (3 * x * x) + (y * y)

			if n <= limit && n%12 == 7 {
				sieve[n] = !sieve[n]
			}

			n = (3 * x * x) - (y * y)

			if x > y && n <= limit && n%12 == 11 {
				sieve[n] = !sieve[n]
			}
		}
	}

	sieve[2] = true

	sieve[3] = true

	primes = append(primes, 2)

	primes = append(primes, 3)

	n = 5

	for n <= squareRootOfLimit {
		if sieve[n] {
			i := n * n

			for i < limit {
				sieve[i] = false

				i += n * n
			}

			primes = append(primes, n)
		}

		n += 2
	}

	for n < limit {
		if sieve[n] {
			primes = append(primes, n)
		}

		n += 2
	}

	return primes
}

func main() {
	n := 10001

	limit := uint64(((float64(n) * math.Log(float64(n))) + (float64(n) * (math.Log(math.Log(float64(n)))))))

	fmt.Println(sieveOfAtkin(limit)[n-1])
}
