#!/bin/bash
set -euo pipefail

BINARY="usr/local/bin/TRRSPO"

if [ ! -f "$BINARY" ]; then
    echo "Ошибка: бинарник не найден по пути $BINARY"
    exit 1
fi

echo "2" | "$BINARY"

echo "Тесты пройдены"

