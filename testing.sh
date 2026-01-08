#!/bin/bash
set -eux

BINARY="../PR_1.0/usr/local/bin/TRRSPO"

if [ ! -f "$BINARY" ]; then
  echo "Ошибка: бинарник не найден по пути $BINARY"
  exit 1
fi

# Входные данные для тестирования
# Матрица 5x5 и матрица 6x6, записанные построчно через пробел
input_array=(
"1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
"2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2"
)

# Ожидаемые результаты: матрицы после замены элементов вне диагоналей на среднее арифметическое
expected_array=(
"1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1" 
"2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2"
)

errors=0

for i in "${!input_array[@]}"; do
  # Передаем на stdin бинарнику
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

