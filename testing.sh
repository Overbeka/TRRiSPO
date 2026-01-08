#!/bin/bash
set -euo pipefail

BINARY="usr/local/bin/TRRSPO"

if [ ! -f "$BINARY" ]; then
    echo "Ошибка: бинарник не найден по пути $BINARY"
    exit 1
fi

# Массивы тестов
# Каждый тест — это строка с пробелами для матрицы, как ожидает твоя программа
input_array=(
"1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
"2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2"
)

# Массив ожидаемых результатов
# Здесь можно подставить правильные результаты после вычисления среднего арифметического
expected_array=(
"Среднее арифметическое заменено в матрице 5x5"
"Среднее арифметическое заменено в матрице 6x6"
)

errors=0

for i in "${!input_array[@]}"; do
    result=$("$BINARY" <<< "${input_array[$i]}")
    
    if [ "$result" == "${expected_array[$i]}" ]; then
        echo "Тест $((i+1)) ✅ OK"
    else
        echo "Тест $((i+1)) ❌ Fail"
        echo "Ожидалось: ${expected_array[$i]}"
        echo "Получено:  $result"
        errors=$((errors+1))
    fi
done

if [ $errors -ne 0 ]; then
    echo "Количество неудачных тестов: $errors"
    exit 1
fi

echo "Все тесты пройдены успешно!"

