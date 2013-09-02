package main

import "fmt"

func main() {
	fibs := []uint64{0, 1}

	for fibs[len(fibs)-1]+fibs[len(fibs)-2] < 4000000 {
		fibs = append(fibs, fibs[len(fibs)-1]+fibs[len(fibs)-2])
	}

	var sum uint64 = 0

	for i := 0; i < len(fibs); i++ {
		if fibs[i]%2 == 0 {
			sum += fibs[i]
		}
	}

	fmt.Println(sum)
}
