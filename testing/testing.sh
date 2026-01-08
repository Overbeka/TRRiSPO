#!/bin/bash

# Массив входных данных
in_array=(
"2"
"1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
)

# Массив ожидаемых результатов
out_array=(
"Матрица"
"Среднее арифметическое"
)

# Путь к программе
PROGRAM="../usr/local/bin/TRRSPO"

for i in 0 1
do
    result=$(echo "${in_array[$i]}" | $PROGRAM)

    if echo "$result" | grep -q "${out_array[$i]}"; then
        echo "Test $i: OK"
    else
        echo "Test $i: FAIL"
        exit 1
    fi
done

exit 0

