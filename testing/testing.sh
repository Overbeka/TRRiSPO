#!/bin/bash

# Путь к бинарнику
BINARY="../PR_1.0/usr/local/bin/TRRSPO"

if [ ! -f "$BINARY" ]; then
  echo "Ошибка: бинарник не найден по пути $BINARY"
  exit 1
fi

# Массив входных данных для тестирования
input_array=(
  "1 2 3 4 5 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  # пример для матрицы 5x5"
  "2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2  # пример для матрицы 6x6"
)

# Массив ожидаемых результатов
expected_array=(
  "матрицы после замены элементов на среднее арифметическое" 
  "матрицы после замены элементов на среднее арифметическое"
)

# Счётчик ошибок
errors=0


for i in "${!input_array[@]}"; do
  result=$(echo "${input_array[$i]}" | "$BINARY")

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
  exit 1
fi

echo "Все тесты пройдены успешно!"

