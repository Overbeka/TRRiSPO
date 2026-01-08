#!/bin/bash
set -euo pipefail

BINARY="usr/local/bin/TRRSPO"

if [ ! -f "$BINARY" ]; then
    echo "Ошибка: бинарник не найден по пути $BINARY"
    exit 1
fi

# Тестовые матрицы: каждая строка — аргумент для программы
# 5x5 матрица
input_5x5="1 1 1 1 1
1 1 1 1 1
1 1 1 1 1
1 1 1 1 1
1 1 1 1 1"

# 6x6 матрица
input_6x6="2 2 2 2 2 2
2 2 2 2 2 2
2 2 2 2 2 2
2 2 2 2 2 2
2 2 2 2 2 2
2 2 2 2 2 2"

# Массивы тестов
inputs=("$input_5x5" "$input_6x6")
expected=("Среднее арифметическое заменено в матрице 5x5" "Среднее арифметическое заменено в матрице 6x6")

errors=0

for i in "${!inputs[@]}"; do
    # Запускаем программу с тестовой матрицей через аргумент или stdin
    result=$(echo "${inputs[$i]}" | "$BINARY")

    if [ "$result" == "${expected[$i]}" ]; then
        echo "Тест $((i+1)) OK"
    else
        echo "Тест $((i+1)) Fail"
        echo "Ожидалось: ${expected[$i]}"
        echo "Получено:  $result"
        errors=$((errors+1))
    fi
done

if [ $errors -ne 0 ]; then
    echo "Количество неудачных тестов: $errors"
    exit 1
fi

echo "Все тесты пройдены успешно!"

