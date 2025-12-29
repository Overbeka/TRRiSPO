package main

import (
	"fmt"
	"math/rand"
)

func main() {
	A, C := make([][]int, 5), make([][]int, 6)
	for i := 0; i < 5; i++ {
		A[i] = make([]int, 5)
		for j := 0; j < 5; j++ {
			A[i][j] = rand.Intn(10)
		}
	}
	for i := 0; i < 6; i++ {
		C[i] = make([]int, 6)
		for j := 0; j < 6; j++ {
			C[i][j] = rand.Intn(10)
		}
	}

	fmt.Println("Матрица A:")
	printMatrix(A)
	fmt.Println("Матрица C:")
	printMatrix(C)

	sum, count := 0, 0
	for i := 0; i < 5; i++ {
		for j := 0; j < 5; j++ {
			if i == j || j == 4-i {
				sum += A[i][j]
				count++
			}
		}
	}
	for i := 0; i < 6; i++ {
		for j := 0; j < 6; j++ {
			if i == j || j == 5-i {
				sum += C[i][j]
				count++
			}
		}
	}

	avg := sum / count
	fmt.Printf("\nСреднее арифметическое диагональных элементов: %d\n\n", avg)

	for i := 0; i < 5; i++ {
		for j := 0; j < 5; j++ {
			if !(i == j || j == 4-i) {
				A[i][j] = avg
			}
		}
	}
	for i := 0; i < 6; i++ {
		for j := 0; j < 6; j++ {
			if !(i == j || j == 5-i) {
				C[i][j] = avg
			}
		}
	}

	fmt.Println("Матрица A после замены недиагональных элементов:")
	printMatrix(A)
	fmt.Println("Матрица C после замены недиагональных элементов:")
	printMatrix(C)
}

func printMatrix(m [][]int) {
	fmt.Print("[")
	for i, row := range m {
		if i > 0 {
			fmt.Print("\n ")
		}
		for _, val := range row {
			fmt.Printf(" %d", val)
		}
	}
	fmt.Println(" ]\n")
}
