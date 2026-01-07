package main

import (
	"bufio"
	"fmt"
	"math"
	"math/rand"
	"os"
	"strconv"
	"strings"
	"time"
)

const (
	minValue = -100
	maxValue = 100
)

func main() {
	reader := bufio.NewReader(os.Stdin)

	fmt.Println("Выберите способ заполнения матриц:")
	fmt.Println("1 — Ввод вручную (через пробел)")
	fmt.Println("2 — Заполнение случайными числами")

	mode := readIntInRange(reader, 1, 2)

	var A [][]int
	var C [][]int

	if mode == 1 {
		fmt.Println("\nВвод матрицы A (5x5):")
		A = readMatrixByRows(reader, 5, 5)

		fmt.Println("\nВвод матрицы C (6x6):")
		C = readMatrixByRows(reader, 6, 6)
	} else {
		rand.Seed(time.Now().UnixNano())
		A = randomMatrix(5, 5)
		C = randomMatrix(6, 6)
	}

	fmt.Println("\nИсходная матрица A:")
	printMatrix(A)

	fmt.Println("\nИсходная матрица C:")
	printMatrix(C)

	avg := calculateDiagonalAverage(A, C)
	fmt.Printf("\nСреднее арифметическое диагональных элементов: %d\n", avg)

	replaceNonDiagonal(A, avg)
	replaceNonDiagonal(C, avg)

	fmt.Println("\nПреобразованная матрица A:")
	printMatrix(A)

	fmt.Println("\nПреобразованная матрица C:")
	printMatrix(C)
}

func readIntInRange(reader *bufio.Reader, min, max int) int {
	for {
		input, _ := reader.ReadString('\n')
		input = strings.TrimSpace(input)
		value, err := strconv.Atoi(input)

		if err != nil || value < min || value > max {
			fmt.Printf("Ошибка! Введите целое число от %d до %d: ", min, max)
			continue
		}
		return value
	}
}

func readMatrixByRows(reader *bufio.Reader, rows, cols int) [][]int {
	matrix := make([][]int, rows)

	for i := 0; i < rows; i++ {
		for {
			fmt.Printf("Введите строку %d (%d чисел через пробел): ", i+1, cols)
			line, _ := reader.ReadString('\n')
			line = strings.TrimSpace(line)

			parts := strings.Fields(line)
			if len(parts) != cols {
				fmt.Printf("Ошибка! Нужно ввести ровно %d чисел.\n", cols)
				continue
			}

			row := make([]int, cols)
			valid := true

			for j, p := range parts {
				val, err := strconv.Atoi(p)
				if err != nil || val < minValue || val > maxValue {
					fmt.Printf("Ошибка! Все элементы должны быть целыми числами от %d до %d.\n", minValue, maxValue)
					valid = false
					break
				}
				row[j] = val
			}

			if valid {
				matrix[i] = row
				break
			}
		}
	}
	return matrix
}

func randomMatrix(rows, cols int) [][]int {
	matrix := make([][]int, rows)
	for i := 0; i < rows; i++ {
		matrix[i] = make([]int, cols)
		for j := 0; j < cols; j++ {
			matrix[i][j] = rand.Intn(maxValue-minValue+1) + minValue
		}
	}
	return matrix
}

func calculateDiagonalAverage(A, C [][]int) int {
	sum := 0
	count := 0

	for i := 0; i < len(A); i++ {
		sum += A[i][i]
		count++
	}
	for i := 0; i < len(C); i++ {
		sum += C[i][i]
		count++
	}

	return int(math.Round(float64(sum) / float64(count)))
}

func replaceNonDiagonal(matrix [][]int, value int) {
	for i := 0; i < len(matrix); i++ {
		for j := 0; j < len(matrix[i]); j++ {
			if i != j {
				matrix[i][j] = value
			}
		}
	}
}

func printMatrix(matrix [][]int) {
	for _, row := range matrix {
		for _, val := range row {
			fmt.Printf("%5d ", val)
		}
		fmt.Println()
	}
}
