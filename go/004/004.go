package main

import "fmt"
import "strconv"
import "sort"

func Reverse(s string) string {
	runes := []rune(s)

	for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
		runes[i], runes[j] = runes[j], runes[i]
	}

	return string(runes)
}

func main() {
	var palindromes []int

	for i := 100; i < 1000; i++ {
		for j := 100; j < 1000; j++ {
			product := i * j

			s := strconv.Itoa(product)

			r := Reverse(s)

			if s == r {
				palindromes = append(palindromes, product)
			}
		}
	}

	sort.Ints(palindromes)

	fmt.Println(palindromes[len(palindromes)-1])
}
