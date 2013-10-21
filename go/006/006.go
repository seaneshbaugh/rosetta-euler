package main

import "fmt"

func main() {
	sumOfSquares := uint64(0)

	sum := uint64(0)

	squareOfSum := uint64(0)

	for i := 1; i <= 100; i++ {
		sumOfSquares += uint64(i * i)

		sum += uint64(i)
	}

	squareOfSum = sum * sum

	fmt.Println(squareOfSum - sumOfSquares)
}
