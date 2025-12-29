#include <stdio.h>

/* Вычислить среднее арифметическое значение элементов, 
лежащих на диагоналях матриц А (5х5) и С (6х6).
Заменить этим значением все элементы обеих матриц,
не лежащие на диагоналях. */

void processMatrix(int n, float m[n][n]) {
    float sum = 0;
    int count = 0;

    // считаем сумму диагоналей
    for (int i = 0; i < n; i++) {
        sum += m[i][i];               // главная диагональ
        count++;

        if (i != n - 1 - i) {         // побочная диагональ (без повторения центра)
            sum += m[i][n - 1 - i];
            count++;
        }
    }

    float avg = sum / count;

    // заменяем всё, что НЕ на диагоналях
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if (j != i && j != n - 1 - i)
                m[i][j] = avg;
        }
    }

    printf("\nAverage for %dx%d matrix = %.2f\n\n", n, n, avg);
}

void printMatrix(int n, float m[n][n]) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++)
            printf("%8.2f ", m[i][j]);
        printf("\n");
    }
}

// Проверка числа с плавающей точкой (float)
int read_float_simple(float *out) {
    char buf[64];
    if (!fgets(buf, sizeof(buf), stdin)) return 0; // EOF или ошибка

    // пытаемся распарсить одно число с плавающей точкой и проверить, что после него нет лишних символов
    float val;
    char extra;
    int matched = sscanf(buf, " %f %c", &val, &extra);
    if (matched == 1) {
        *out = val;
        return 1;
    }
    // неверный ввод
    printf("Invalid input: please enter a number\n");
    return 0;
}

int main() {
    float matrixA[5][5];
    float matrixB[6][6];

    printf("Enter 25 numbers for matrix A (5x5):\n");
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            if (read_float_simple(&matrixA[i][j]) == 0) {
                return 0;
            }
        }
    }

    printf("Enter 36 numbers for matrix B (6x6):\n");
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 6; j++) {
            if (read_float_simple(&matrixB[i][j]) == 0) {
                return 0;
            }
        }
    }

    processMatrix(5, matrixA);
    processMatrix(6, matrixB);

    printf("Matrix A after:\n");
    printMatrix(5, matrixA);

    printf("\nMatrix B after:\n");
    printMatrix(6, matrixB);

    return 0;
}